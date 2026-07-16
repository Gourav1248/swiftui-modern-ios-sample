//
//  StoresViewModel.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 08/07/26.
//
//  ───────────────────────────────────────────────────────────
//  FULL COMBINE VERSION (no Task/async-await for the fetch chain)
//  Every Combine concept used here is explained inline so you
//  can explain it confidently in an interview.
//  ───────────────────────────────────────────────────────────

import Foundation
import Combine

@MainActor
class StoresViewModel: ObservableObject {

   // MARK: - Published state (bind directly in SwiftUI)
   // @Published automatically creates a Combine PUBLISHER accessible via $searchText.
   // Output = String, Failure = Never (a @Published property can never "fail").
   @Published var searchText: String = ""
   @Published var stores: [StoresDataModel] = []      // TODO: match with your actual response model's array property
   @Published var storeTags: [StoreTagsModel] = []
   @Published var storeBanners: StoreBannerDataModel = StoreBannerDataModel()
   @Published var isLoading: Bool = false
   @Published var isLoadingMore: Bool = false
   @Published var isInitialLoading: Bool = false
   @Published var errorMessage: String?

   // MARK: - Pagination
   private var currentPage = 1
   private let pageSize = 25
   private var canLoadMore = true
   private let storeWebService: StoreWebServiceProtocol?

   init(storeWebService: StoreWebServiceProtocol = StoresWebService.sharedInstance) {
      self.storeWebService = storeWebService
      observeSearchText()
   }

   // MARK: - Guard against duplicate initial loads
   // .task {} on a SwiftUI view runs once per view identity, but if the parent
   // view gets recreated (e.g. tab switch + rebuild), it could fire again.
   // This flag makes loadInitialDataIfNeeded() safely idempotent.
   private var hasLoadedInitialData = false

   // MARK: - Cancellables
   // Every Combine subscription (.sink, .assign) returns an AnyCancellable "token".
   // If you don't store that token somewhere, ARC deallocates it immediately
   // and your subscription silently stops working (a very common bug).
   // Storing them in this Set keeps them alive for the ViewModel's lifetime;
   // when the ViewModel deallocates, the Set is destroyed and ALL subscriptions
   // are automatically cancelled — no manual cleanup needed.
   private var cancellables = Set<AnyCancellable>()


   // MARK: - Combine: debounce search text, auto-trigger new search
   //
   // Full pipeline explained top to bottom:
   //
   // $searchText            → PUBLISHER. Emits every time searchText changes (every keystroke).
   // .removeDuplicates()    → OPERATOR. Skips a value if it's identical to the previous one.
   //                          Prevents redundant API calls if the same text somehow fires twice.
   // .debounce(...)         → OPERATOR. Waits for 500ms of SILENCE before letting a value through.
   //                          If the user is still typing, nothing is emitted. This is what makes
   //                          it "search-as-you-type" friendly instead of firing on every keystroke.
   // .map { ... }           → OPERATOR. Transforms each String into a Publisher
   //                          (specifically, an AnyPublisher<[StoresDataModel], Never>) by calling
   //                          our fetch function. At this point we have a "publisher of publishers"
   //                          — a nested/stream-of-streams shape.
   // .switchToLatest()      → OPERATOR. Flattens that nested publisher AND cancels the previous
   //                          inner publisher whenever a new one arrives. This is the key difference
   //                          from flatMap: if the user types "ip" then quickly "iphone", the "ip"
   //                          network request gets cancelled instead of racing with "iphone"'s result.
   // .receive(on: .main)    → OPERATOR. Forces everything downstream (i.e. sink) to run on the
   //                          main thread — required because we're about to touch @Published
   //                          properties, which drive SwiftUI UI updates.
   // .sink { ... }          → SUBSCRIBER. Terminal operator that actually consumes emitted values
   //                          and runs side effects (updating our @Published state here).
   // .store(in: &cancellables) → Keeps the whole chain alive (see cancellables comment above).
   private func observeSearchText() {
      $searchText
         .removeDuplicates()
         .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
         .map { [weak self] text -> AnyPublisher<[StoresDataModel], Never> in
            guard let self else {
               return Empty().eraseToAnyPublisher()
            }
            self.currentPage = 1
            self.canLoadMore = true
            self.isLoading = true
            return self.fetchStoresPublisher(searchText: text, append: false)
         }
         .switchToLatest()
         .receive(on: DispatchQueue.main)
         .sink { [weak self] newStores in
            guard let self else { return }
            self.isLoading = false
            self.stores = newStores
            self.canLoadMore = !newStores.isEmpty
         }
         .store(in: &cancellables)
   }

   func loadInitialDataIfNeeded() async {
      guard !hasLoadedInitialData else {
         return
      }
      hasLoadedInitialData = true

      isInitialLoading = true
      defer {
         isInitialLoading = false
      }
      currentPage = 1
      canLoadMore = true


      Publishers.Zip3(
         fetchStoreBanners(), fetchStoreTagsPublisher(), fetchStoresPublisher(searchText: "", append: false)
      ).receive(on: DispatchQueue.main)
         .sink { [weak self] bannersResult, tagsResult, storesResult in
            guard let self else {
               return
            }
            self.stores = storesResult
            self.storeTags = tagsResult
            self.storeBanners = bannersResult
            self.canLoadMore = !storesResult.isEmpty
            self.isInitialLoading = false
         }
         .store(in: &cancellables)
   }

   // MARK: - Call this on screen load (plain listing, no search)
   func loadStores() {
      currentPage = 1
      canLoadMore = true
      isLoading = true

      fetchStoresPublisher(searchText: searchText, append: false)
         .receive(on: DispatchQueue.main)
         .sink { [weak self] newStores in
            guard let self else { return }
            self.isLoading = false
            self.stores = newStores
            self.canLoadMore = !newStores.isEmpty
         }
         .store(in: &cancellables)
   }

   // MARK: - Call this when user scrolls to bottom (pagination)
   //
   // Note: pagination intentionally uses a plain .sink call (not routed through
   // switchToLatest) because we WANT every "load next page" request to complete
   // independently — cancelling an in-flight page-2 request just because page-3
   // was requested would break append-based pagination.
   func loadNextPageIfNeeded() {
      guard canLoadMore, !isLoading, !isLoadingMore else { return }
      currentPage += 1
      isLoadingMore = true

      fetchStoresPublisher(searchText: searchText, append: true)
         .receive(on: DispatchQueue.main)
         .sink { [weak self] newStores in
            guard let self else { return }
            self.isLoadingMore = false
            if newStores.isEmpty {
               self.canLoadMore = false
            }
            self.stores.append(contentsOf: newStores)
         }
         .store(in: &cancellables)
   }

   // MARK: - Core fetch — bridges async/await service into a Combine Publisher
   //
   // FUTURE: A publisher that emits EXACTLY ONE value (or one failure) and then
   // completes — like a one-shot Promise. It's the standard bridge for wrapping
   // async/await code so it can live inside a Combine pipeline.
   //
   // We use Failure == Never here (swallowing the error internally and setting
   // errorMessage directly) to keep observeSearchText()'s pipeline simple —
   // Combine pipelines get awkward when Failure types don't match on both sides
   // of an operator like switchToLatest. If you want failures to propagate through
   // the Combine chain itself (so you can use .catch/.retry upstream), change the
   // Failure type to Error and promise(.failure(error)) instead of swallowing it.
   //
   // ANYPUBLISHER: Future, Just, PassthroughSubject etc. are all distinct concrete
   // types with their own generic signatures. AnyPublisher erases that concrete
   // type away so the function signature stays clean — callers only care about
   // Output/Failure, not which publisher type produced them (same idea as
   // returning `some View` in SwiftUI).
   private func fetchStoresPublisher(searchText: String, append: Bool) -> AnyPublisher<[StoresDataModel], Never> {
      Future<[StoresDataModel], Never> { [weak self] promise in
         guard let self else {
            promise(.success([]))
            return
         }

         Task {
            do {
               let response = try await self.storeWebService?.fetchAllStoresAsync(
                  isPopulateLogo: true,
                  isPopulateCashBack: true,
                  pageSize: self.pageSize,
                  pageNo: self.currentPage,
                  status: "published",
                  sort: "id:desc",
                  storeTag: "",
                  categories: "",
                  filterBy: "",
                  shippingLocations: "",
                  searchText: searchText
               )

               let newStores = response?.data ?? []
               promise(.success(newStores))
            } catch {
               await MainActor.run {
                  self.errorMessage = error.localizedDescription
               }
               promise(.success([]))
            }
         }
      }
      .eraseToAnyPublisher()
   }

   func fetchStoreTagsPublisher() -> AnyPublisher<[StoreTagsModel], Never> {
      //Ye future ki closure he
      // init(_ attemptToFulfill: @escaping (@escaping (Result<Output, Failure>) -> Void) -> Void)
      Future<[StoreTagsModel], Never> { [weak self] promise in

         guard let self else {
            promise(.success([]))
            return
         }

         Task {
            do  {
               let response = try await self.storeWebService?.fetchStoreTags()
               let newTags = response?.data ?? []
               promise(.success(newTags))
            } catch {
               await MainActor.run(body: {
                  self.errorMessage = error.localizedDescription
               })
               promise(.success([]))
            }
         }
      }
      .eraseToAnyPublisher()
   }

   func fetchStoreBanners() -> AnyPublisher<StoreBannerDataModel, Never> {
      Future<StoreBannerDataModel, Never> { [weak self] promise in

         guard let self else {
            promise(.success(StoreBannerDataModel()))
            return
         }

         Task {
            do {
               let response = try await self.storeWebService?.fetchStoreBanners()
               let newBanners = response?.data ?? StoreBannerDataModel()
               promise(.success(newBanners))
            } catch {
               await MainActor.run(body: {
                  self.errorMessage = error.localizedDescription
               })
               promise(.success(StoreBannerDataModel()))
            }
         }
      }
      .eraseToAnyPublisher()
   }
}


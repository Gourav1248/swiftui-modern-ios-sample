import SwiftUI

struct StoreListView: View {
    let banners: [BannerSliderModel]
    let tags: [StoreTagsModel]
    //let stores: [StoresDataModel]
   @State private var isSearchActive: Bool = false

   @StateObject private var viewModel = StoresViewModel()

    var body: some View {

        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
               StoreTopBarView(
                  countryFlag: "🇨🇭",
                  cashbackAmount: "235 CHF",
                  onCountryTapped: {},
                  onWishlistTapped: {},
                  onSearchTapped: {}
               )


               SearchBarView(searchText: $viewModel.searchText, isActive: $isSearchActive, onCancel: {
                  viewModel.searchText = ""
               })
                .padding(12)
                .background(Color.indigo.opacity(0.08))
                .cornerRadius(12)
                .padding(.horizontal, 16)

               BannerCarouselView(banners: viewModel.storeBanners)

                HStack {
                    Text("All Stores")
                        .font(.title3.bold())
                    Spacer()
                    Button(action: {}) {
                        Text("Browse Category")
                            .font(.caption.bold())
                            .foregroundColor(.indigo)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Capsule().stroke(Color.indigo.opacity(0.4)))
                    }
                }
                .padding(.horizontal, 16)

               TagListView(tags: viewModel.storeTags)

                LazyVStack(spacing: 14) {
                   ForEach(viewModel.stores, id: \.id) { store in
                        StoreCellView(store: store, screenWidth: 325)
                         .onAppear {
                            if store.id == viewModel.stores.last?.id {
                               viewModel.loadNextPageIfNeeded()
                            }
                         }
                    }
                }
                .padding(.horizontal, 16)
            }
            .padding(.top, 8)
            .padding(.bottom, 16)
        }
        .padding(.bottom, 36)
        .task {
           await viewModel.loadInitialDataIfNeeded()
        }

       if viewModel.isLoadingMore {
          ProgressView()
             .frame(maxWidth: .infinity)
             .padding(.vertical, 16)
       }
    }
}

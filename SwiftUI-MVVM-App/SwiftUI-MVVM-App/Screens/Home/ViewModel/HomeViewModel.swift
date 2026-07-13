//
//  HomeViewModel.swift
//  SwiftUI-MVVM-App
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {

   @Published var errorMessage: String?
   @Published var isLoading: Bool = false
   @Published var banners: [BannerSliderModel] = []
   @Published var stores: [StoresDataModel] = []
   @Published var vouchers: [DealsAndVoucherModel] = []


   // ✅ Protocol instead of concrete class — enables mocking in XCTest
   private let homeWebService: HomeWebServiceProtocol

   init(homeWebService: HomeWebServiceProtocol = HomeWebService.shared) {
      self.homeWebService = homeWebService
   }


   func fetchHomeDetailsData() async {
      isLoading = true
      errorMessage = nil

      do {
         let response = try await homeWebService.fetchHomeDetailsAPI()

         print("response.data?.storesSection?.featuredStores = \(response.data?.storesSection?.featuredStores?.count)")
         banners = response.data?.bannerSlider ?? []
         stores = response.data?.storesSection?.featuredStores ?? []
         vouchers = response.data?.voucherSection?.featuredVouchers ?? []
      } catch {
         errorMessage = error.localizedDescription
      }

      isLoading = false
   }
}

//
//  HomeWebService.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 22/04/26.
//

import Foundation

class HomeWebService {

   static let shared = HomeWebService()

   private init() {}
}

extension HomeWebService {

   func fetchHomeDetailsAPI() async throws -> HomeDataResponseModel {
      try await WebService.shared.GetWebAPIData(
         param: homeQueryParameters(),
         endPointName: APIRouter.Home.All,
         headers: WebServiceHeaders.general
      )
   }

   private func homeQueryParameters() -> [String: Any] {
      return [
         "populate[bannerSection][populate][logo]": true,
         "populate[bannerSlider][populate][image]": true,
         "populate[referBanner]": true,
         "populate[projectSection][populate][donationProjects]": true,
         "populate[statsSection][populate][item]": true,
         "status": "published",
         "populate[storesSection][populate][featuredStores][populate][storeCashback]": true,
         "populate[storesSection][populate][featuredStores][populate][categories]": true,
         "populate[storesSection][populate][featuredStores][populate][storeTag]": true,
         "populate[storesSection][populate][featuredStores][populate][logo]": true,
         "populate[voucherSection][populate][featuredVouchers][populate][store][populate][storeTag]": true,
         "populate[voucherSection][populate][featuredVouchers][populate][store][populate][logo]": true,
         "populate[voucherSection][populate][featuredVouchers][populate][store][populate][categories][populate][icon]": true,
         "populate[storesSection][populate][featuredStores][filters][primaryRegion][countryCode]": "en",
         "populate[voucherSection][populate][featuredVouchers][filters][store][primaryRegion][countryCode]": "de",
         "locale": "en"
      ]
   }
}

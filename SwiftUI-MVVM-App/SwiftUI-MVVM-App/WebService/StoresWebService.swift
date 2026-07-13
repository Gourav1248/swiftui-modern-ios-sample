//
//  StoresWebService.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 09/07/26.
//

import Foundation
import UIKit


// Simple wrapper so the existing String-based errorCompletion becomes a proper Swift Error
struct StoreServiceError: Error, LocalizedError {
   let message: String
   var errorDescription: String? { message }
}

// This is called service layer
class StoresWebService {

   static let sharedInstance = StoresWebService()

   private init() { }

   // MARK: - Search + Store Listing (same API — searchText param drives search)
   func fetchAllStoresAsync(
      isPopulateLogo: Bool,
      isPopulateCashBack: Bool,
      pageSize: Int,
      pageNo: Int,
      status: String,
      sort: String,
      storeTag: String,
      categories: String,
      filterBy: String,
      shippingLocations: String,
      searchText: String
   ) async throws -> StoresDataResponseModel {

      // Query string build — same logic jo pehle tha, ab endPointName me pass karenge
      var strUrl = "\(APIRouter.Stores.All)populate[logo]=\(isPopulateLogo)&populate[storeCashback]=\(isPopulateCashBack)&pagination[pageSize]=\(pageSize)&pagination[page]=\(pageNo)&status=\(status)&sort[0]=\(sort)&populate[storeTag]=true&populate[categories]=true&populate[shippingLocations]=true&filters[primaryRegion][countryCode][$eq]=DE&locale=en"

      if storeTag.count > 0 {
         strUrl += "&filters[storeTag][documentId][$in]=\(storeTag)"
      }

      if categories.count > 0 {
         let arrCats = categories.components(separatedBy: ",")
         for i in 0..<arrCats.count {
            strUrl += "&filters[categories][documentId][$in][\(i)]=\(arrCats[i])"
         }
      }

      if filterBy.count > 0 {
         strUrl += "&filters[storeFilters][documentId][$in]=\(filterBy)"
      }

      if shippingLocations.count > 0 {
         strUrl += "&filters[shippingLocations][documentId][$in]=\(shippingLocations)"
      }

      if searchText.count > 0 {
         strUrl += "&filters[name][$containsi]=\(searchText)"
      }

      dPrint("strUrl = \(strUrl)")

      // MARK: - Direct decode via GetWebAPIData — no manual JSON parsing needed
      // NOTE: StoresDataResponseModel ko `Decodable` conform karna zaroori hai,
      // warna yahan compile error aayega ("T must conform to Decodable").
      // Agar abhi wo ObjectMapper/Mappable based class hai, use Codable struct me convert karna hoga.
      return try await WebService.shared.GetWebAPIData(
         param: nil,
         endPointName: strUrl,
         headers: WebServiceHeaders.authorized
      )
   }

   func fetchStoreTags() async throws -> StoreTagsDataResponseModel {
      let strUrl = "\(APIRouter.Stores.Tags)populate[icon]=true&location="

      return try await WebService.shared.GetWebAPIData(param: nil, endPointName: strUrl, headers: WebServiceHeaders.general)
   }

   func fetchStoreBanners() async throws -> StoreBannersDataResponse {

      let strUrl = "\(APIRouter.Stores.BannerSlider)populate[storeBanners][populate][image]=true&locale=en"

      return try await WebService.shared.GetWebAPIData(param: nil, endPointName: strUrl, headers: WebServiceHeaders.general)
   }
}


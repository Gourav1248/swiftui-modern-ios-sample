//
//  ProfileWebService.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 27/07/26.
//

import Foundation

class ProfileWebService {

   static let shared = ProfileWebService()

   private init() {

   }
}

extension ProfileWebService: ProfileWebServiceProtocol {

   func getUserProfileAPI() async throws -> UserCreationDataResponse {
      let strUrl = APIRouter.Profile.MyProfile
      return try await WebService.shared.GetWebAPIData(param: nil, endPointName: strUrl, headers: WebServiceHeaders.authorized)
   }

   func getUserActivitiesAPI() async throws -> UserActivitiesDataResponse {
      let strUrl = APIRouter.Profile.MyActivities
      return try await WebService.shared.GetWebAPIData(param: nil, endPointName: strUrl, headers: WebServiceHeaders.authorized)
   }

   func getPurchaseTransactionsAPI() async throws -> TransactionModelDataResponse {
      let strUrl = APIRouter.Payouts.MyTransaction
      return try await WebService.shared.GetWebAPIData(param: nil, endPointName: strUrl, headers: WebServiceHeaders.authorized)
   }
}

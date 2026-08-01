//
//  ProfileWebServiceProtocol.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 27/07/26.
//

import Foundation

protocol ProfileWebServiceProtocol {
   func getUserProfileAPI() async throws -> UserCreationDataResponse
   func getUserActivitiesAPI() async throws -> UserActivitiesDataResponse
   func getPurchaseTransactionsAPI() async throws -> TransactionModelDataResponse
}

class MockProfileWebService: ProfileWebServiceProtocol {

   var mockProfileResponse: UserCreationDataResponse?
   var mockActivitiesResponse: UserActivitiesDataResponse?
   var mockTransactionResult: TransactionModelDataResponse?
   var shouldThrow = false

   func getUserProfileAPI() async throws -> UserCreationDataResponse {
      if shouldThrow {
         throw NetworkError.unknown
      }
      return mockProfileResponse!
   }

   func getUserActivitiesAPI() async throws -> UserActivitiesDataResponse {
      if shouldThrow {
         throw NetworkError.unknown
      }

      return mockActivitiesResponse!
   }

   func getPurchaseTransactionsAPI() async throws -> TransactionModelDataResponse {
      if shouldThrow {
         throw NetworkError.unknown
      }
      return mockTransactionResult!
   }
   
}

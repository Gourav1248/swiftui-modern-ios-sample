//
//  HomeWebServiceProtocol.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 22/04/26.
//

import Foundation
// HomeWebServiceProtocol.swift

protocol HomeWebServiceProtocol {
   func fetchHomeDetailsAPI() async throws -> HomeDataResponseModel
}

// Make real service conform
extension HomeWebService: HomeWebServiceProtocol {}

// Mock for tests
class MockHomeWebService: HomeWebServiceProtocol {
   var mockResult: HomeDataResponseModel?
   var shouldThrow = false

   func fetchHomeDetailsAPI() async throws -> HomeDataResponseModel {
      if shouldThrow { throw NetworkError.unknown }
      return mockResult!
   }
}

// Update ViewModel to accept the protocol instead


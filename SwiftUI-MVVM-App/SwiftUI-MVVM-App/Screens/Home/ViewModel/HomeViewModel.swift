//
//  HomeViewModel.swift
//  SwiftUI-MVVM-App
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {

   @Published var homeData: HomeDataResponseModel?
   @Published var errorMessage: String?
   @Published var isLoading: Bool = false


   // ✅ Protocol instead of concrete class — enables mocking in XCTest
   private let homeWebService: HomeWebServiceProtocol

   init(homeWebService: HomeWebServiceProtocol = HomeWebService.shared) {
      self.homeWebService = homeWebService
   }


   func fetchHomeDetailsData() async {
      isLoading = true
      errorMessage = nil

      do {
         homeData = try await homeWebService.fetchHomeDetailsAPI()
      } catch {
         errorMessage = error.localizedDescription
      }

      isLoading = false
   }
}

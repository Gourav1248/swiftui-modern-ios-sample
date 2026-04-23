//
//  Home.swift
//  SwiftUI-MVVM-AppTests
//
//  Created by Gourav Joshi on 22/04/26.
//

//
//  HomeWebServiceTests.swift
//  SwiftUI-MVVM-AppTests
//

import XCTest
@testable import SwiftUI_MVVM_App

final class HomeViewModelTests: XCTestCase {

   var viewModel: HomeViewModel!
   var mockService: MockHomeWebService!

   override func setUp() {
      super.setUp()
      mockService = MockHomeWebService()
      viewModel = HomeViewModel(homeWebService: mockService)
   }

   func test_fetchHomeDetails_success() async {
      // Given
      mockService.mockResult = HomeDataResponseModel(/* stub your model */)

      // When
      await viewModel.fetchHomeDetails()

      // Then
      XCTAssertNotNil(viewModel.homeData)
      XCTAssertNil(viewModel.errorMessage)
      XCTAssertFalse(viewModel.isLoading)
   }

   func test_fetchHomeDetails_failure() async {
      // Given
      mockService.shouldThrow = true

      // When
      await viewModel.fetchHomeDetails()

      // Then
      XCTAssertNil(viewModel.homeData)
      XCTAssertNotNil(viewModel.errorMessage)
      XCTAssertFalse(viewModel.isLoading)
   }
}

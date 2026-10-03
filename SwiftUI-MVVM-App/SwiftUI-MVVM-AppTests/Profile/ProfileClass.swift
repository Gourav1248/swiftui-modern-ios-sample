//
//  ProfileClass.swift
//  SwiftUI-MVVM-AppTests
//
//  Created by Gourav Joshi on 01/08/26.
//

import XCTest
@testable import SwiftUI_MVVM_App

@MainActor
final class ProfileClass: XCTestCase {


   var profileViewModel: ProfileViewModel!
   var mockService: MockProfileWebService!

    override func setUpWithError() throws {
       mockService = MockProfileWebService()
       profileViewModel = ProfileViewModel(profileWebService: mockService)
       
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
       mockService = nil
       profileViewModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


   func testCallUserProfileDetails_Successfully() async throws {
      mockService.mockProfileResponse = .mockUserResponse(user: .mockUserData(
         username: "gourav_joshi",
         email: "gourav@example.com",
         walletBalance: 500
      ))
      mockService.mockActivitiesResponse = UserActivitiesDataResponse(activityDetails: [/* your model */])
      mockService.mockTransactionResult = TransactionModelDataResponse(transactions: [/* your model */])
      mockService.shouldThrow = false

      // When
      await profileViewModel.loadProfileDetailsData()

      // Then
      XCTAssertNil(profileViewModel.errorMessage)
      XCTAssertEqual(profileViewModel.userProfile.username, "gourav_joshi")
      XCTAssertEqual(profileViewModel.userProfile.email, "gourav@example.com")
      XCTAssertEqual(profileViewModel.userProfile.walletBalance, 500)

   }

}

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

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

   func callUserProfileDetails_Successfully() {
      profileViewModel.loadProfileDetailsData()
   }

}

//
//  LoginViewModel.swift
//  SwiftUI-LearningTests
//
//  Created by Gourav Joshi on 03/04/26.
//

import XCTest
@testable import SwiftUI_Learning

final class LoginClass: XCTestCase {
   var viewModel: LoginViewModel!
   var delegate: MockUserDelegate!

   @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       viewModel = LoginViewModel()
      delegate = MockUserDelegate()
    }

    override func tearDownWithError() throws {
       viewModel = nil
       delegate = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   @MainActor
   func testLoginWithValidDetails() async {

      let request = LoginRequest(identifier: "iosui1@mailinator.com", password: "Test@1234")

      await viewModel.loginRequest(params: request)
      XCTAssertNil(viewModel.errorMessage)
   }

   @MainActor
   func testLoginWithInvalidDetails() async {
      let request = LoginRequest(identifier: "ios1@mailinator.com", password: "Test@123")

      await viewModel.loginRequest(params: request)
      XCTAssertNotNil(viewModel.errorMessage)
   }

   @MainActor
   func testLoginWithEmptyDetails() async {
      let request = LoginRequest(identifier: "", password: "")

      await viewModel.loginRequest(params: request)
      XCTAssertNotNil(viewModel.errorMessage)
   }

   @MainActor
   func testLoginShouldCallDelegateOnSuccess() async {

      viewModel.userResponseDelegate = delegate

      let request = LoginRequest(
         identifier: "iosui1@mailinator.com",
         password: "Test@1234"
      )

      await viewModel.loginRequest(params: request)

      XCTAssertTrue(delegate.didReceiveUser)
   }
}

class MockUserDelegate: UserCreationDelegate {

   var didReceiveUser = false

   func fetchUserData(user: UserCreationDataResponse) {
      didReceiveUser = true
   }
}

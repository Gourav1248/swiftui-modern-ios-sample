//
//  SignUpClass.swift
//  SwiftUI-LearningTests
//
//  Created by Gourav Joshi on 03/04/26.
//

import XCTest
@testable import SwiftUI_Learning

final class SignUpClass: XCTestCase {
   var viewModel: SignUpViewModel!
   var delegate: MockUserDelegate!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       viewModel = SignUpViewModel()
       delegate = MockUserDelegate()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
       viewModel = nil
       delegate = nil
    }

   func testSignUpWithValidMockDetails() async {
      viewModel.userResponseDelegate = delegate
      let request = SignUpRequestParams.validMock()

      await viewModel.userCreationRequest(params: request)

      XCTAssertTrue(delegate.didReceiveUser)
      XCTAssertNil(viewModel.errorMessage)
   }

   func testSignUpWithInvalidMockDetails() async {

      let request = SignUpRequestParams.inValidMock()
      viewModel.userResponseDelegate = delegate

      await viewModel.userCreationRequest(params: request)

      XCTAssertNil(viewModel.errorMessage)
   }

   func testSignUpWithEmptyMockDetails() async {

      let request = SignUpRequestParams.inValidMock()

      viewModel.userResponseDelegate = delegate
      await viewModel.userCreationRequest(params: request)

      await MainActor.run {
         XCTAssertNil(viewModel.errorMessage)
      }
   }
}

extension SignUpRequestParams {

   static func validMock(
      username: String = "Titan Joseph",
      email: String = "user1@mailinator.com",
      password: String = "Test@1234",
      phoneNumber: String = "9926409876",
      givenName: String = "Titan",
      familyName: String = "Joseph"
   ) -> SignUpRequestParams {

      return SignUpRequestParams(
         username: username,
         email: email,
         password: password,
         phoneNumber: phoneNumber,
         givenName: givenName,
         familyName: familyName
      )
   }

   static func inValidMock(
      username: String = "Titan Joseph",
      email: String = "ios@mailinator.co",
      password: String = "Test@",
      phoneNumber: String = "926435",
      givenName: String = "Titan",
      familyName: String = "Jose"
   ) -> SignUpRequestParams {

      return SignUpRequestParams(
         username: username,
         email: email,
         password: password,
         phoneNumber: phoneNumber,
         givenName: givenName,
         familyName: familyName
      )
   }

   static func emptyMock(
      username: String = "",
      email: String = "",
      password: String = "",
      phoneNumber: String = "",
      givenName: String = "",
      familyName: String = ""
   ) -> SignUpRequestParams {

      return SignUpRequestParams(
         username: username,
         email: email,
         password: password,
         phoneNumber: phoneNumber,
         givenName: givenName,
         familyName: familyName
      )
   }
}

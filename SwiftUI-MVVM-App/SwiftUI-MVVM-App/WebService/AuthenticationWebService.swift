//
//  AuthenticationWebService.swift
//  Squilio-iOS
//
//  Created by Gourav Joshi on 02/02/26.
//

import UIKit

class AuthenticationWebService {
  
  static let shared = AuthenticationWebService()
  
  private init(){} 
}

extension AuthenticationWebService {
  
  func loginRequestAPI(requestParams: LoginRequest) async throws -> UserCreationDataResponse {
    try await WebService.shared
      .PostWebAPIData(
        param: WebService.shared.convertToDictionary(requestParams),
        endPointName: APIRouter.UserStories.Login,
        headers: WebServiceHeaders.general
      )
  }
  
  func forgptPasswordRequestAPI(requestParams: ForgotPasswordRequest) async throws -> ForgotPasswordResponse {
    try await WebService.shared
      .PostWebAPIData(
        param: WebService.shared.convertToDictionary(requestParams),
        endPointName: APIRouter.UserStories.ForgotPassword,
        headers: WebServiceHeaders.general
      )
  }

   func signUpRequestAPI(requestParams: SignUpRequestParams) async throws -> UserCreationDataResponse {
      try await WebService.shared.PostWebAPIData(param: WebService.shared.convertToDictionary(requestParams), endPointName: APIRouter.UserStories.Registration, headers: WebServiceHeaders.general)
   }
}

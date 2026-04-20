//
//  LoginViewModel.swift
//  Squilio-iOS
//
//  Created by Gourav Joshi on 20/01/26.
//

import UIKit

@MainActor
class LoginViewModel: ObservableObject {

   private let loginHandler: (LoginRequest) async throws -> UserCreationDataResponse
   @Published var isLoading = false
   @Published var errorMessage: String?
   // MARK: - Init
   init(
      loginHandler: @escaping (LoginRequest) async throws -> UserCreationDataResponse = { request in
         try await AuthenticationWebService.shared.loginRequestAPI(requestParams: request)
      }
   ) {
      self.loginHandler = loginHandler
   }
  
  var userResponseDelegate: UserCreationDelegate?


  func loginRequest(params: LoginRequest) async {
    
    do {
        let response = try await AuthenticationWebService.shared.loginRequestAPI(requestParams: params)
      userResponseDelegate?.fetchUserData(user: response)
    } catch {
       errorMessage = error.localizedDescription
      dPrint("Error in loginRequest response \(error.localizedDescription)")
    }
  }
}

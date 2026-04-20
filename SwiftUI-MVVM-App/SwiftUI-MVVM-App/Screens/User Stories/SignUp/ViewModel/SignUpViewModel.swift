//
//  SignUpViewModel.swift
//  SwiftUI-Learning
//
//  Created by Gourav Joshi on 23/03/26.
//

import Foundation


class SignUpViewModel: ObservableObject {
   @Published var errorMessage: String?
   var userResponseDelegate: UserCreationDelegate?

   func userCreationRequest(params: SignUpRequestParams) async {
      do {
         let response = try await AuthenticationWebService.shared.signUpRequestAPI(requestParams: params)
         await MainActor.run {
            self.userResponseDelegate?.fetchUserData(user: response)
         }
      } catch {
         dPrint("Error in signUpRequestAPI response \(error.localizedDescription)")
      }
   }
}

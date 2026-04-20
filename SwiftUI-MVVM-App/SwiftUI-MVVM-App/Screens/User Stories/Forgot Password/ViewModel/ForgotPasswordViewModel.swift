//
//  ForgotPasswordViewModel.swift
//  Squilio-iOS
//
//  Created by Gourav Joshi on 04/02/26.
//

import Foundation


@MainActor
class ForgotPasswordViewModel: ObservableObject {
  
  var forgotPasswordDelegate: ForgotPasswordProtocol?
  
  func forgotPasswordRequest(requestParams: ForgotPasswordRequest) async {
    do {
      let response = try await AuthenticationWebService.shared.forgptPasswordRequestAPI(requestParams: requestParams)
      forgotPasswordDelegate?.didUpdateForgotPasswordResponse(response: response)
    } catch {
      dPrint("Error in forgotPasswordRequest response \(error.localizedDescription)")
    }
  }
}

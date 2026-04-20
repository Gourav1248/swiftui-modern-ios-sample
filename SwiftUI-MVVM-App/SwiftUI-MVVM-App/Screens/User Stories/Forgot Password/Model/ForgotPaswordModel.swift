//
//  ForgotPaswordModel.swift
//  Squilio-iOS
//
//  Created by Gourav Joshi on 04/02/26.
//


struct ForgotPasswordRequest: Encodable {
  var email: String = String()
}

struct ForgotPasswordResponse: Codable {
  var ok: Bool? = Bool()
}

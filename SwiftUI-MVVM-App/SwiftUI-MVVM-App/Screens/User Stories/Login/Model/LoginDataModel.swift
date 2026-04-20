//
//  LoginDataModel.swift
//  Squilio-iOS
//
//  Created by Gourav Joshi on 02/02/26.
//

import Foundation

struct LoginRequest: Encodable {
  var identifier: String = String()
  var password: String = String()
}

struct UserCreationDataResponse: Codable {
  var jwt: String = String()
  var user: UserDataModel = UserDataModel()
}

struct UserDataModel: Codable {
  var id: Int = Int()
  var documentId: String = String()
  var username: String = String()
  var email: String = String()
  var provider: String = String()
  var confirmed: Bool = Bool()
  var blocked: Bool = Bool()
  var createdAt: String = String()
  var updatedAt: String = String()
  var publishedAt: String = String()
  var phoneNumber: String? = String()
  var givenName: String? = String()
  var familyName: String? = String()
  var totalStash: CGFloat? = CGFloat()
  var totalDonated: CGFloat? = CGFloat()
  var totalPayout: CGFloat? = CGFloat()
  var walletBalance: CGFloat? = CGFloat()
  var cashbackPending: CGFloat? = CGFloat()
  var image: LogoDataModel? = LogoDataModel()
  var setReferredStep: Bool? = Bool()
  var refLink: String? = String()
}

struct LogoDataModel: Codable {
  var id: Int? = Int()
  var documentId: String? = String()
  var name: String? = String()
  var alternativeText: String? = String()
  var caption: String? = String()
  var width: Int? = Int()
  var height: Int? = Int()
  var hash: String? =  String()
  var ext: String? = String()
  var mime: String? = String()
  var size: CGFloat? = CGFloat()
  var url: String? = String()
  var createdAt: String? = String()
  var updatedAt: String? = String()
  var publishedAt: String? = String()
  var provider: String? = String()
}

//
//  UserDataModel+Mock.swift
//  SwiftUI-MVVM-AppTests
//
//  Created by Gourav Joshi on 01/08/26.
//

import Foundation
@testable import SwiftUI_MVVM_App

extension UserDataModel {
    static func mockUserData(id: Int = 101,
                     username: String = "gourav_joshi",
                     email: String = "gourav@example.com",
                     givenName: String? = "Gourav",
                     familyName: String? = "Joshi",
                     walletBalance: CGFloat? = 250.0,
                     totalStash: CGFloat? = 500.0) -> UserDataModel {
      var model = UserDataModel()
      model.id = id
      model.username = username
      model.email = email
      model.givenName = givenName
      model.familyName = familyName
      model.walletBalance = walletBalance
      model.totalStash = totalStash
      model.confirmed = true
      model.blocked = false
      return model
   }
}

extension UserCreationDataResponse {
   static mockUserResponse(user: UserDataModel = .mockUserData()) -> UserCreationDataResponse {
      var response = UserCreationDataResponse()
      response.jwt = "mock-jwt-token"
      response.user = user
      return response
   }
}

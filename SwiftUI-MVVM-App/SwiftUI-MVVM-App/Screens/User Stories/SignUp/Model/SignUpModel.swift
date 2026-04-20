//
//  SignUpModel.swift
//  SwiftUI-Learning
//
//  Created by Gourav Joshi on 23/03/26.
//

import Foundation

struct SignUpRequestParams: Encodable {
   var username: String = String()
   var email: String = String()
   var password: String = String()
   var phoneNumber: String = String()
   var givenName: String = String()
   var familyName: String = String()
}

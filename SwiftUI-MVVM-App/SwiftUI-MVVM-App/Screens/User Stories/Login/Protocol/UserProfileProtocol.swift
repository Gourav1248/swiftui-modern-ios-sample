//
//  UserProfileProtocol.swift
//  Squilio-iOS
//
//  Created by Gourav Joshi on 02/02/26.
//

import Foundation


protocol UserCreationDelegate {
  func fetchUserData(user: UserCreationDataResponse)
}

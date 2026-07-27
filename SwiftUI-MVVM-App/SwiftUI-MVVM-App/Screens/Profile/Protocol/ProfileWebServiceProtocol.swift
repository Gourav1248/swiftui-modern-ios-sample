//
//  ProfileWebServiceProtocol.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 27/07/26.
//

import Foundation

protocol ProfileWebServiceProtocol {
   func getUserProfileAPI() async throws -> UserCreationDataResponse
}

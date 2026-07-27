//
//  ProfileViewModel.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 27/07/26.
//

import Foundation


@MainActor
class ProfileViewModel: ObservableObject {

   @Published var errorMessage: String?
   @Published var isLoading: Bool = false
   @Published var userProfile: [UserDataModel] = []
   private let profileWebService: ProfileWebServiceProtocol

   init(profileWebService: ProfileWebServiceProtocol = ProfileWebService.shared) {
      self.profileWebService = profileWebService
   }
   
}

extension ProfileViewModel {

   func getUserProfileData() async {
      isLoading = true
      errorMessage = nil
      do {
         let response = try await profileWebService.getUserProfileAPI()
         isLoading = false
      } catch {
         errorMessage = error.localizedDescription
      }
   }

   
}

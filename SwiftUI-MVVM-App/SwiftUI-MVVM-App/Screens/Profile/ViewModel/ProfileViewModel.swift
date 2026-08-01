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
   @Published var userProfile: UserDataModel = UserDataModel()
   @Published var arrActivities: [UserActivitiesDataModel] = [UserActivitiesDataModel]()
   @Published var arrTransactions: [TransactionDataModel] = [TransactionDataModel]()
   private let profileWebService: ProfileWebServiceProtocol

   init(profileWebService: ProfileWebServiceProtocol = ProfileWebService.shared) {
      self.profileWebService = profileWebService
   }
   
}

extension ProfileViewModel {

   @MainActor
   func loadProfileDetailsData() async {
      isLoading = true
      errorMessage = nil

      defer {
         isLoading = false
      }

      do {
         async let userProfile = getUserProfileData()
         async let userActivities = getUserActivities()
         async let userTransactions = getPurchaseTransactions()


         let (profileResponse, activitiesResponse, transactionResponse) = try await (userProfile, userActivities, userTransactions)
         self.userProfile = profileResponse.user
         self.arrActivities = activitiesResponse.activityDetails ?? [UserActivitiesDataModel]()
         self.arrTransactions = transactionResponse.transactions ?? [TransactionDataModel]()

      } catch {
         errorMessage = error.localizedDescription
      }

   }

   private func getUserProfileData() async throws -> UserCreationDataResponse {
      return try await profileWebService.getUserProfileAPI()
   }

   private func getUserActivities() async throws -> UserActivitiesDataResponse {
      return try await profileWebService.getUserActivitiesAPI()
   }

   private func getPurchaseTransactions() async throws -> TransactionModelDataResponse {
      return try await profileWebService.getPurchaseTransactionsAPI()
   }
}

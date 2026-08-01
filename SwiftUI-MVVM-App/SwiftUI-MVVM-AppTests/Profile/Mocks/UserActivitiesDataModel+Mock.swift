//
//  UserActivitiesDataModel+Mock.swift
//  SwiftUI-MVVM-AppTests
//
//  Created by Gourav Joshi on 01/08/26.
//

import Foundation

@testable import SwiftUI_MVVM_App

extension UserActivitiesDataModel {
   static func mock(
      id: Int? = 1,
      documentId: String? = "activity-doc-001",
      createdAt: String? = "2026-07-01T10:00:00.000Z",
      updatedAt: String? = "2026-07-01T10:00:00.000Z",
      publishedAt: String? = "2026-07-01T10:00:00.000Z",
      description: String? = "Cashback earned on purchase",
      store: StoresDataModel? = StoresDataModel(),
      deal: DealsAndVoucherModel? = DealsAndVoucherModel()
   ) -> UserActivitiesDataModel {
      var model = UserActivitiesDataModel()
      model.id = id
      model.documentId = documentId
      model.createdAt = createdAt
      model.updatedAt = updatedAt
      model.publishedAt = publishedAt
      model.description = description
      model.store = store
      model.deal = deal
      return model
   }
}

extension UserActivitiesDataResponse {
   static func mock(
      activityDetails: [UserActivitiesDataModel]? = [.mock(), .mock(id: 2, documentId: "activity-doc-002")]
   ) -> UserActivitiesDataResponse {
      var response = UserActivitiesDataResponse()
      response.activityDetails = activityDetails
      return response
   }

   static func mockEmpty() -> UserActivitiesDataResponse {
      var response = UserActivitiesDataResponse()
      response.activityDetails = []
      return response
   }

   static func mockNilActivities() -> UserActivitiesDataResponse {
      var response = UserActivitiesDataResponse()
      response.activityDetails = nil
      return response
   }
}

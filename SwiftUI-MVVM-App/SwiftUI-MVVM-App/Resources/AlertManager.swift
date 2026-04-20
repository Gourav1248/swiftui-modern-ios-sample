//
//  AlertManager.swift
//  Squilio-iOS
//
//  Created by Gourav Joshi on 03/02/26.
//
import Foundation
import Combine

import SwiftUI

@MainActor
final class AlertManager: ObservableObject {
  
  static let shared = AlertManager()
  
  @Published var alertItem: AlertItem?
  
  private init() {}
  
  func show(
    title: String = "Alert",
    message: String
  ) {
    alertItem = AlertItem(
      title: title,
      message: message
    )
  }
  
  func show(error: Error) {
    let message =
    (error as? LocalizedError)?.errorDescription
    ?? "Something went wrong"
    
    alertItem = AlertItem(
      title: "Error",
      message: message
    )
  }
}


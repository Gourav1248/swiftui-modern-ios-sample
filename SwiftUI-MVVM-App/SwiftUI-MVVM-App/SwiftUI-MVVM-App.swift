//
//  SwiftUI_LearningApp.swift
//  SwiftUI-Learning
//
//  Created by Gourav Joshi on 22/03/26.
//

import SwiftUI


@main
struct SwiftUI_MVVM_App: App {
   @StateObject private var alertManager = AlertManager.shared

   var body: some Scene {
      WindowGroup {
         SplashView()
            .environmentObject(alertManager)
      }
   }
}

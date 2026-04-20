//
//  RootView.swift
//  SwiftUI-Learning
//
//  Created by Gourav Joshi on 05/04/26.
//

import SwiftUI

struct RootView: View {

   @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

   var body: some View {
      if isLoggedIn {
         MainTabView()
      } else {
         LoginView()
      }
   }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

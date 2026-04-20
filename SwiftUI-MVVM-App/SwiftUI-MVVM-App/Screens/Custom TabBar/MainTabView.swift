//
//  MainTabView.swift
//  SwiftUI-Learning
//
//  Created by Gourav Joshi on 25/03/26.
//

import SwiftUI

enum Tab {
   case home
   case settings
   case profile
}


struct MainTabView: View {

   @State private var selectedTab: Tab = .home

   var body: some View {

      ZStack(alignment: .bottom) {

         Group {
            switch selectedTab {
               case .home:
                  Text("Home Screen")

               case .settings:
                  Text("Store Screen")

               case .profile:
                  Text("Profile Screen")
            }
         }
         .frame(maxWidth: .infinity, maxHeight: .infinity)

         CustomTabBar(selectedTab: $selectedTab)
            .padding(.horizontal)
            .ignoresSafeArea(edges: .bottom) // 🔥 key line
      }
   }
   
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

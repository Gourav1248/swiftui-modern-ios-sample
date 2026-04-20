//
//  CustomTabBar.swift
//  SwiftUI-Learning
//
//  Created by Gourav Joshi on 25/03/26.
//

import SwiftUI

enum TabIcon {
   case system(String)
   case asset(String)
}

struct CustomTabBar: View {

   @Binding var selectedTab: Tab

   var body: some View {

     // ZStack(alignment: .bottom) {

         HStack {
            tabItem(icon: .system("house"), tab: .home)
            Spacer()

            tabItem(icon: .asset("explore_icon"), tab: .settings)
            Spacer()

            tabItem(icon: .asset("profile_icon"), tab: .profile)
         }
         .frame(height: 50)
         .frame(maxWidth: .infinity)
         .padding(.horizontal, 30)
         .padding(.top, 15)
         .padding(.bottom, 5)
         .background(.white)
         .cornerRadius(20)
         .shadow(radius: 5)
         //.clipShape(RoundedRectangle(cornerRadius: 20))
      //}
   }

   func tabItem(icon: TabIcon, tab: Tab) -> some View {
      Button {
         selectedTab = tab
      } label: {
         Group {
            switch icon {
               case .system(let name):
                  Image(systemName: name)
                     .renderingMode(.template)
                     .resizable()
                     .scaledToFit()

               case .asset(let name):
                  Image(name)
                     .renderingMode(.template)
                     .resizable()
                     .scaledToFit()
            }
         }
            .frame(width: 22, height: 22)
            .foregroundColor(selectedTab == tab ? Color("AppVoilet") : Color("AppLightGray"))
      }
   }
}


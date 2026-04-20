//
//  SplashView.swift
//  Squilio-iOS
//
//  Created by Gourav Joshi on 07/01/26.
//

import SwiftUI

struct SplashView: View {

   @State private var isActive = false
   @State private var scale: CGFloat = 0.8
   @EnvironmentObject var alertManager: AlertManager

   var body: some View {

      if isActive {
         RootView()   // 🔥 direct switch (no navigation)
      } else {
         ZStack {
            Color("AppLavender").ignoresSafeArea()

            VStack(spacing: 20) {
               Image("AppLogo")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 140)
                  .scaleEffect(scale)

               Text("SwiftUI-MVVM Demo")
                  .font(.largeTitle)
                  .bold()
                  .foregroundColor(.white)
            }
         }
         .onAppear {
            withAnimation(.easeIn(duration: 1.0)) {
               scale = 1.0
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
               withAnimation {
                  isActive = true   // 🔥 screen switch
               }
            }
         }
      }
   }
}


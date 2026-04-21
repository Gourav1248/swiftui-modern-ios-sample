//
//  HomeView.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 21/04/26.
//

import SwiftUI

import SwiftUI

// MARK: - HomeView

struct HomeView: View {
   @State private var showMenu = false
   @State private var showLogoutAlert = false  // Add this
   @AppStorage("userStoredDetails") private var obUser: Data = Data()
   @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false

   var currentUser: UserDataModel? {
      return try? JSONDecoder().decode(UserDataModel.self, from: obUser)
   }

   var body: some View {
      NavigationStack {
         ZStack(alignment: .topTrailing) {
            Color.white.ignoresSafeArea()

            VStack(spacing: 0) {
               // Custom Navigation Bar
               customNavBar

               Spacer()
            }

            // Menu Overlay
            if showMenu {
               menuOverlay
            }
         }
         .navigationBarHidden(true)
      }
   }

   // MARK: - Custom Nav Bar

   private var customNavBar: some View {
      HStack {
         VStack(alignment: .leading, spacing: 2) {
            Text("Hello, \(currentUser?.givenName ?? "") \(currentUser?.familyName ?? "") 👋")
               .font(.system(size: 13, weight: .regular))
               .foregroundColor(.gray)
            Text("My Home")
               .font(.system(size: 24, weight: .bold))
               .foregroundColor(.black)
         }

         Spacer()

         HStack(spacing: 10) {
            // Logout Button
            Button(action: {
               showLogoutAlert = true
            }) {
               ZStack {
                  Circle()
                     .fill(Color.red.opacity(0.1))
                     .frame(width: 44, height: 44)

                  Image(systemName: "arrow.backward.circle.fill")
                     .font(.system(size: 20))
                     .foregroundColor(.red)
               }
            }

            // Menu Button
            Button(action: {
               withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                  showMenu.toggle()
               }
            }) {
               ZStack {
                  Circle()
                     .fill(
                        LinearGradient(
                           colors: [Color(hex: "#6C63FF"), Color(hex: "#48C6EF")],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing
                        )
                     )
                     .frame(width: 44, height: 44)
                     .shadow(color: Color(hex: "#6C63FF").opacity(0.4), radius: 8, x: 0, y: 4)

                  Image(systemName: showMenu ? "xmark" : "line.3.horizontal")
                     .font(.system(size: 16, weight: .semibold))
                     .foregroundColor(.white)
                     .animation(.easeInOut(duration: 0.2), value: showMenu)
               }
            }
         }
      }
      .padding(.horizontal, 20)
      .padding(.top, 12)
      .padding(.bottom, 16)
      .background(Color.white)
      .alert("Logout", isPresented: $showLogoutAlert) {
         Button("Cancel", role: .cancel) { }
         Button("Yes, Logout", role: .destructive) {
            handleLogout()
         }
      } message: {
         Text("Are you sure you want to logout?")
      }
   }

   // MARK: - Menu Overlay

   private var menuOverlay: some View {
      VStack(alignment: .trailing, spacing: 0) {
         Spacer().frame(height: 80)

         VStack(alignment: .leading, spacing: 0) {
            menuItem(icon: "person.circle", title: "My Profile")
            Divider().padding(.leading, 48)
            menuItem(icon: "bell", title: "Notifications")
            Divider().padding(.leading, 48)
            menuItem(icon: "gearshape", title: "Settings")
            Divider().padding(.leading, 48)
            menuItem(icon: "questionmark.circle", title: "Help & Support")
            Divider().padding(.leading, 48)
         }
         .background(Color.white)
         .cornerRadius(16)
         .shadow(color: Color.black.opacity(0.12), radius: 20, x: 0, y: 8)
         .padding(.trailing, 20)
         .frame(width: 220)
      }
      .frame(maxWidth: .infinity, alignment: .trailing)
      .transition(.opacity.combined(with: .scale(scale: 0.9, anchor: .topTrailing)))
   }

   private func menuItem(icon: String, title: String, isDestructive: Bool = false) -> some View {
      Button(action: { showMenu = false }) {
         HStack(spacing: 14) {
            Image(systemName: icon)
               .font(.system(size: 16))
               .foregroundColor(isDestructive ? .red : Color(hex: "#6C63FF"))
               .frame(width: 22)
            Text(title)
               .font(.system(size: 14, weight: .medium))
               .foregroundColor(isDestructive ? .red : .black)
            Spacer()
         }
         .padding(.horizontal, 16)
         .padding(.vertical, 14)
      }
   }

   private func handleLogout() {
      UserDefaults.standard.removeObject(forKey: "loggedInUser")
      isLoggedIn = false

   }
}



// MARK: - Color Extension

extension Color {
   init(hex: String) {
      let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
      var int: UInt64 = 0
      Scanner(string: hex).scanHexInt64(&int)
      let a, r, g, b: UInt64
      switch hex.count {
         case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
         case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
         case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
         default:
            (a, r, g, b) = (255, 0, 0, 0)
      }
      self.init(
         .sRGB,
         red: Double(r) / 255,
         green: Double(g) / 255,
         blue: Double(b) / 255,
         opacity: Double(a) / 255
      )
   }
}

// MARK: - Preview

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

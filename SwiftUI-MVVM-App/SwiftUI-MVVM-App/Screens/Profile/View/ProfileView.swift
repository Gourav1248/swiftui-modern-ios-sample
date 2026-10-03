//
//  ProfileView.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 27/07/26.
//

import SwiftUI

struct ProfileView: View {

   @StateObject var obProfile: ProfileViewModel = ProfileViewModel()

    var body: some View {
       VStack {
         Text("Profile")

          Text("Name = \(obProfile.userProfile.givenName ?? "")")

          HStack {
             Text("Activities = \n \(obProfile.arrActivities.count)")
             Text("Transactions = \n \(obProfile.arrTransactions.count)")
          }


       }
       .task {
          await obProfile.loadProfileDetailsData()
       }
       .onAppear() {

       }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

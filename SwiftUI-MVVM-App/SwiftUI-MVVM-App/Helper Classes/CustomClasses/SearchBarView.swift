//
//  SearchView.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 10/07/26.
//

import SwiftUI

struct SearchBarView: View {
   @Binding var searchText: String
   @Binding var isActive: Bool
   var placeholder: String = "Search stores"
   var onCancel: () -> Void = {}

   var body: some View {
      HStack(spacing: 8) {
         HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
               .foregroundColor(.gray)

            TextField(placeholder, text: $searchText, onEditingChanged: { editing in
               withAnimation(.easeInOut(duration: 0.2)) {
                  isActive = editing
               }
            })
            .foregroundColor(.black)
            .submitLabel(.search)

            if !searchText.isEmpty {
               Button(action: {
                  searchText = ""
               }) {
                  Image(systemName: "xmark.circle.fill")
                     .foregroundColor(.gray)
               }
            }
         }
         .padding(.horizontal, 10)
         .padding(.vertical, 8)
         .background(Color(.systemGray6))
         .cornerRadius(10)

         if isActive {
            Button("Cancel") {
               withAnimation(.easeInOut(duration: 0.2)) {
                  searchText = ""
                  isActive = false
               }
               hideKeyboard()
               onCancel()
            }
            .font(.subheadline)
            .foregroundColor(.indigo)
            .transition(.move(edge: .trailing).combined(with: .opacity))
         }
      }
      .padding(.horizontal, 16)
      .animation(.easeInOut(duration: 0.2), value: isActive)
   }

   private func hideKeyboard() {
      UIApplication.shared.sendAction(
         #selector(UIResponder.resignFirstResponder),
         to: nil, from: nil, for: nil
      )
   }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//       SearchBarView(searchText: <#Binding<String>#>, isActive: <#Binding<Bool>#>)
//    }
//}

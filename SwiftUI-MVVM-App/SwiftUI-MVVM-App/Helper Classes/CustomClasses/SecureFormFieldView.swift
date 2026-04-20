//
//  SecureFormFieldView.swift
//  SwiftUI-Learning
//
//  Created by Gourav Joshi on 24/03/26.
//

import SwiftUI

struct SecureFormFieldView: View {

   var title: String
   var placeholder: String
   @Binding var text: String

   var body: some View {

      VStack(alignment: .leading, spacing: 8) {

         Text(title)
            .font(.subheadline)
            .foregroundColor(Color("AppBlack"))

         SecureField(
            "",
            text: $text,
            prompt: Text(placeholder)
               .foregroundColor(.gray)
         )
         .foregroundColor(Color("AppBlack"))
         .padding()
         .background(Color.gray.opacity(0.1))
         .cornerRadius(12)
      }
   }
}

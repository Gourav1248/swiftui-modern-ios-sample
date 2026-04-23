//
//  ReferBannerView.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 23/04/26.
//

import SwiftUI

//
//  ReferBannerView.swift
//

import SwiftUI

struct ReferBannerView: View {

   var onReferTap: () -> Void = {}

   var body: some View {
      ZStack(alignment: .trailing) {
         RoundedRectangle(cornerRadius: 16)
            .fill(Color(hex: "#F0F6FF"))
            .overlay(
               RoundedRectangle(cornerRadius: 16)
                  .strokeBorder(
                     style: StrokeStyle(lineWidth: 1.5, dash: [6])
                  )
                  .foregroundColor(Color.blue.opacity(0.4))
            )

         HStack(spacing: 0) {

            VStack(alignment: .leading, spacing: 8) {
               Text("Good things grow when shared 🤝")
                  .font(.system(size: 15, weight: .bold))
                  .foregroundColor(.black)
                  .lineLimit(2)

               Text("Get rewards when your friends join the Squilio club.")
                  .font(.system(size: 13))
                  .foregroundColor(.gray)
                  .lineLimit(2)

               Spacer().frame(height: 4)

               Button(action: onReferTap) {
                  Text("Refer")
                     .font(.system(size: 13, weight: .semibold))
                     .foregroundColor(.blue)
                     .padding(.horizontal, 20)
                     .padding(.vertical, 8)
                     .overlay(
                        RoundedRectangle(cornerRadius: 20)
                           .strokeBorder(
                              style: StrokeStyle(lineWidth: 1.5, dash: [4])
                           )
                           .foregroundColor(.blue)
                     )
               }
            }
            .padding(.leading, 16)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity, alignment: .leading)

            Image("gift_box")
               .resizable()
               .scaledToFit()
               .frame(width: 110, height: 110)
               .padding(.trailing, 8)
         }
      }
      .frame(height: 130)
      .padding(.horizontal, 16)
   }
}

struct ReferBannerView_Previews: PreviewProvider {
    static var previews: some View {
        ReferBannerView()
    }
}

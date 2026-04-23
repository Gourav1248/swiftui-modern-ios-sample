//
//  BannerSectionView.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 23/04/26.
//

import SwiftUI


struct BannerSectionView: View {

   let banners: [BannerSectionModel]
   @State private var currentIndex: Int = 0

   var body: some View {
      VStack(spacing: 10) {
         ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
               ForEach(Array(banners.enumerated()), id: \.element.id) { index, banner in
                  BannerCellView(banner: banner)
                     .onAppear { currentIndex = index }
               }
            }
            .padding(.horizontal, 16)
         }

         // Page dots
         HStack(spacing: 6) {
            ForEach(0..<banners.count, id: \.self) { index in
               Circle()
                  .fill(index == currentIndex ? Color.blue : Color.gray.opacity(0.4))
                  .frame(width: index == currentIndex ? 8 : 6,
                         height: index == currentIndex ? 8 : 6)
                  .animation(.easeInOut, value: currentIndex)
            }
         }
      }
      .padding(.vertical, 8)
   }
}



// MARK: - Banner Cell
struct BannerCellView: View {

   let banner: BannerSectionModel

   var body: some View {
      ZStack {
         RoundedRectangle(cornerRadius: 16)
            .fill(.white)

         HStack(alignment: .top, spacing: 0) {

            VStack(alignment: .leading, spacing: 8) {
               Text(banner.title ?? "")
                  .font(.system(size: 16, weight: .bold))
                  .foregroundColor(.black)
                  .lineLimit(2)

               Text(banner.subTitle ?? "")
                  .font(.system(size: 13))
                  .foregroundColor(.gray)
                  .lineLimit(3)

               Spacer()

               HStack(spacing: 12) {

                  Text("Badge")
                     .font(.system(size: 13, weight: .bold))
                     .foregroundColor(.red)
               }
            }
            .padding(.leading, 16)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity, alignment: .leading)

            Image(banner.logo?.url ?? "")
               .resizable()
               .scaledToFit()
               .frame(width: 100, height: 110)
               .padding(.trailing, 8)
               .padding(.top, 8)
         }
      }
      .frame(width: 300, height: 150)
      .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 4)
   }
}

//struct BannerSectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        BannerSectionView()
//    }
//}

//
//  StoreSectionView.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 22/04/26.
//
//  StoresSectionView.swift
//

import SwiftUI

struct StoresSectionView: View {

   let stores: [StoresDataModel]
   var onViewAll: () -> Void = {}

   var body: some View {
      VStack(alignment: .leading, spacing: 12) {

         // Section Header
         SectionHeaderView(title: "Shops you might like", onViewAll: onViewAll)
            .padding(.horizontal, 16)

         // Horizontal Scroll
         ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
               ForEach(stores, id: \.id) { store in
                  StoreCellView(store: store)
               }
            }
            .padding(.horizontal, 16)
         }
      }
      .padding(.vertical, 8)
   }
}



struct StoreCellView: View {

   let store: StoresDataModel

   var body: some View {
      VStack(alignment: .leading, spacing: 8) {

         // Top — category + logo
         HStack {
            Text(store.categories?.first?.name ?? "")
               .font(.system(size: 11, weight: .medium))
               .foregroundColor(.gray)
               .padding(.horizontal, 8)
               .padding(.vertical, 3)
               .background(Color.gray.opacity(0.12))
               .cornerRadius(8)

            Spacer()

            AsyncImage(url: URL(string: store.logo?.url ?? "")) { image in
               image
                  .resizable()
                  .scaledToFit()
            } placeholder: {
               Color.gray.opacity(0.1)
            }
            .frame(width: 48, height: 28)
         }

         // Store name
         Text(store.name ?? "")
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(.black)

         // Cashback
         Text("\(store.storeCashback?.cashbackPercentage ?? 0.0)")
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(.black)

         // Tags
         HStack(spacing: 6) {

            // isTrending — storeTag array se check
            if store.storeTag?.contains(where: {
               $0.title?.lowercased() == "trending"
            }) == true {
               TagPillView(
                  icon: "🔥",
                  label: "Trending",
                  foregroundColor: .orange,
                  backgroundColor: Color.orange.opacity(0.1)
               )
            }

            // hasVoucher — isFeatured se check
            if store.isFeatured == true {
               TagPillView(
                  icon: "🎟️",
                  label: "Voucher Inside",
                  foregroundColor: .purple,
                  backgroundColor: Color.purple.opacity(0.1)
               )
            }
         }
      }
      .padding(14)
      .frame(width: 175)
      .background(Color.white)
      .cornerRadius(14)
      .shadow(color: .black.opacity(0.07), radius: 8, x: 0, y: 3)
   }
}


struct TagPillView: View {

   let icon: String
   let label: String
   let foregroundColor: Color
   let backgroundColor: Color

   var body: some View {
      HStack(spacing: 4) {
         Text(icon)
            .font(.system(size: 11))
         Text(label)
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(foregroundColor)
      }
      .padding(.horizontal, 8)
      .padding(.vertical, 4)
      .background(backgroundColor)
      .cornerRadius(12)
   }
}

//struct StoreSectionView_Previews: PreviewProvider {
//    static var previews: some View {
//       StoresSectionView()
//    }
//}

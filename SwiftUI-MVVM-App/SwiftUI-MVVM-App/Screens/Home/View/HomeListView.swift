//
//  HomeListView.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 22/04/26.
//

import SwiftUI


struct HomeListView: View {

   let banners: [BannerSectionModel]
   let stores: [StoresDataModel]
   let vouchers: [DealsAndVoucherModel]
   var onStoresViewAll: () -> Void = {}
   var onVouchersViewAll: () -> Void = {}
   var onReferTap: () -> Void = {}

   var body: some View {
      List {

            BannerSectionView(banners: banners)
               .listRowInsets(EdgeInsets())
               .listRowBackground(Color.clear)
               .listRowSeparator(.hidden)


            StoresSectionView(
               stores: stores,
               onViewAll: { onStoresViewAll() }
            )
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)

            VouchersSectionView(
               vouchers: vouchers,
               onViewAll: { onVouchersViewAll() }
            )
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)



            ReferBannerView(onReferTap: { onReferTap() })
               .listRowInsets(EdgeInsets())
               .listRowBackground(Color.clear)
               .listRowSeparator(.hidden)

      }
      .listStyle(.plain)


   }
}

//
//  SectionHeaderView.swift
//


struct SectionHeaderView: View {

   let title: String
   var onViewAll: () -> Void = {}

   var body: some View {
      HStack {
         Text(title)
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.black)

         Spacer()

         Button(action: onViewAll) {
            Text("View All")
               .font(.system(size: 14, weight: .semibold))
               .foregroundColor(.blue)
         }
      }
   }
}

//struct HomeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeListView()
//    }
//}

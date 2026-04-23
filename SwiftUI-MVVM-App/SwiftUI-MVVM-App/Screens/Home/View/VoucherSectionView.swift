//
//  VoucherSectionView.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 22/04/26.
//
//
//  VouchersSectionView.swift
//

import SwiftUI

struct VouchersSectionView: View {

   let vouchers: [DealsAndVoucherModel]
   var onViewAll: () -> Void = {}

   var body: some View {
      VStack(alignment: .leading, spacing: 12) {

         // Section Header
         SectionHeaderView(title: "Curated vouchers", onViewAll: onViewAll)
            .padding(.horizontal, 16)

         // Horizontal Scroll
         ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
               ForEach(vouchers, id: \.id) { voucher in
                  VoucherCellView(voucher: voucher)
               }
            }
            .padding(.horizontal, 16)
         }
      }
      .padding(.vertical, 8)
   }
}

// MARK: - Voucher Cell
struct VoucherCellView: View {

   let voucher: DealsAndVoucherModel

   var body: some View {
      VStack(alignment: .leading, spacing: 10) {

         HStack(spacing: 8) {
            Text(voucher.name ?? "")
               .font(.system(size: 14, weight: .semibold))
               .foregroundColor(.black)

            Text(voucher.store?.name ?? "")
               .font(.system(size: 11, weight: .medium))
               .foregroundColor(.gray)
               .padding(.horizontal, 8)
               .padding(.vertical, 3)
               .background(Color.gray.opacity(0.12))
               .cornerRadius(8)

            Spacer()

            Image(voucher.logo?.url ?? "")
               .resizable()
               .scaledToFit()
               .frame(width: 40, height: 28)
         }

         Divider()

         Text(voucher.store?.displayUrl ?? "")
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.black)

         Text(voucher.createdAt ?? "23-04-2026")
            .font(.system(size: 12))
            .foregroundColor(.gray)
      }
      .padding(14)
      .frame(width: 200)
      .background(Color.white)
      .cornerRadius(14)
      .shadow(color: .black.opacity(0.07), radius: 8, x: 0, y: 3)
   }
}

//struct VoucherSectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        VoucherSectionView()
//    }
//}

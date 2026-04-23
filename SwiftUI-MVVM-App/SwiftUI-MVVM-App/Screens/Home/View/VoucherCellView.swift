//
//  VoucherCellView.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 22/04/26.
//

import SwiftUI

// MARK: - Model
struct VoucherItem: Identifiable {
   let id: UUID = UUID()
   let storeName: String
   let category: String
   let logoName: String
   let discountText: String
   let validTill: String
}





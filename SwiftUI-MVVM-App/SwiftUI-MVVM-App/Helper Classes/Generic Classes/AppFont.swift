//
//  AppFont.swift
//  SwiftUI-Learning
//
//  Created by Gourav Joshi on 23/03/26.
//

import Foundation

import SwiftUI

struct AppFont {

   static let largeTitle = Font.system(size: 34, weight: .bold)
   static let title = Font.system(size: 28, weight: .semibold)
   static let heading = Font.system(size: 22, weight: .semibold)

   static let body = Font.system(size: 16, weight: .regular)
   static let bodyMedium = Font.system(size: 16, weight: .medium)

   static let caption = Font.system(size: 14, weight: .regular)
   static let small = Font.system(size: 12, weight: .regular)
   static let textLight = Font.system(size: 17, weight: .regular)
   static let textMedium = Font.system(size: 17, weight: .medium)

}

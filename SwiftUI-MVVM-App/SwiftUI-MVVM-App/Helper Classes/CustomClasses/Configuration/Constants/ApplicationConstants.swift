//
//  ApplicationConstants.swift
//  OnManicLine
//
//  Created by CTPLMac6 on 12/11/18.
//  Copyright © 2018 CTPLMac7. All rights reserved.
//

import Foundation
import UIKit




enum MFontType {
  case ExtraLight
  case Bold
  case Light
  case Medium
  case SemiBold
  case Regular
  case ExtraBold
}

func ManropeFont(size: CGFloat, type: MFontType)  -> UIFont {
  switch type {
    case .ExtraLight:
      return UIFont.init(name: "Manrope-ExtraLight", size: size)!
    case .Bold:
      return UIFont.init(name: "Manrope-Bold", size: size)!
    case .Light:
      return UIFont.init(name: "Manrope-Light", size: size)!
    case .Medium:
      return UIFont.init(name: "Manrope-Medium", size: size)!
    case .SemiBold:
      return UIFont.init(name: "Manrope-SemiBold", size: size)!
    case .Regular:
      return UIFont.init(name: "Manrope-Regular", size: size)!
    case .ExtraBold:
      return UIFont.init(name: "Manrope-ExtraBold", size: size)!
  }
}

//Notifications
let kNotificationReachabilityLost = "ReachabilityLostNotification"

struct GradientTheme {
  static let color1 = "#1FEDF8"
  static let color2 = "#1F8EFF"
}

//
//  PPAlerts.swift
//  HealthLayby
//
//  Created by CMR010 on 22/05/23.
//

import UIKit
import Foundation

private var sharedAlert : PPAlerts? = nil
enum AlertType : Int {
  case adefault = 0
  case toast
}

class PPAlerts: NSObject {
  
  class func sharedAlerts() -> PPAlerts {
    if sharedAlert == nil {
      sharedAlert = PPAlerts()
    }
    return sharedAlert!
  }
  
  //MARK: - Alerts
  func showMessage(with alertType: AlertType, withMessage message: String) {
    self.showAlert(with: alertType, withMessage: message, withTitle: "", withTimeoutInterval: 10.0)
  }
  
  func showAlert(with alertType: AlertType, withMessage message: String) {
    self.showAlert(with: alertType, withMessage: message, withTitle: "")
  }
  
  func showAlert(with alertType: AlertType, withMessage message:String, withTitle title:String?) {
    self.showAlert(with: alertType, withMessage: message, withTitle: title, withTimeoutInterval: 2.0)
  }
  
  func showAlert(with alertType: AlertType, withMessage message:String, withTitle title:String?, withTimeoutInterval interval:TimeInterval){
    var strmsg : String = ""
    if ((title as String?) ?? "").isEmpty {
      strmsg = message
    } else if ((message as String?) ?? "").isEmpty {
      strmsg = title!
    } else {
      strmsg = "\(String(describing: title)) \n \(message)"
    }
    
    switch alertType {
    case .adefault:
      break
    case .toast:
      break
     // ToastAlert(message: strmsg, withTimeoutImterval: interval)
    }
  }
  
 
  
  
}

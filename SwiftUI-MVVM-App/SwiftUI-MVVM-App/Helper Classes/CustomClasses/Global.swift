//
//  HearderParams.swift
//  Squilio
//
//  Created by Admin on 13/05/24.
//

import Foundation
import UIKit

class Global {
    
    //MARK: - Shared Instance
    private static var sharedInstance: Global?
    
    //MARK: - Shared Manager
    class var sharedManager : Global {
        guard let sharedInstance = self.sharedInstance else {
            let sharedInstance = Global()
            self.sharedInstance = sharedInstance
            return sharedInstance
        }
        return sharedInstance
    }
    
    private init() {}
    
    //MARK: - Header Parameter
    let headerParam = ["Authorization": UserDefaultHelper.acessToken,
                       "accept-language": UserDefaultHelper.selectedLanguage,
                       "accept": "application/json"]
  
  var storeDeviceHeaders: [String: String] {
    return [
      "Authorization": "Bearer \(UserDefaultHelper.acessToken)",
      "accept-language": UserDefaultHelper.selectedLanguage,
      "accept": "application/json"
    ]
  }
    
    let intStoreAndVouchersPageLimit = 50
    let intPaginationLimit = 20
    let isLive: Bool = true
    
    //MARK: - Destroy Shared Manager
    class func destroySharedManager() {
        sharedInstance = nil
    }
  
  
  let PhoneNoLength = 10
  let NameLength = 15
  
  func getNumberAcceptValidation(string: String) -> String {
    let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
    let compSepByCharInSet = string.components(separatedBy: aSet)
    let numberFiltered = compSepByCharInSet.joined(separator: "")
    return numberFiltered
  }
  
  func getCharacterAcceptValidation(string: String) -> String {
    let aSet = NSCharacterSet(charactersIn: "ABCDEFGHIJKLMONPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ").inverted
    let compSepByCharInSet = string.components(separatedBy: aSet)
    let characterFiltered = compSepByCharInSet.joined(separator: "")
    return characterFiltered
  }
  
  func getAlphaNumericAcceptValidation(string: String) -> String {
    let aSet = NSCharacterSet(charactersIn: "ABCDEFGHIJKLMONPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ").inverted
    let compSepByCharInSet = string.components(separatedBy: aSet)
    let characterFiltered = compSepByCharInSet.joined(separator: "")
    return characterFiltered
  }
  
  func checkFieldCharacterAndLength(range: NSRange, string: String, tfText: String, maxLength: Int, strChar: String) -> Bool {
    let currentString: NSString = tfText as NSString
    let newString = currentString.replacingCharacters(in: range, with: string)
    return newString.count <= maxLength && string == strChar
  }
  
}

enum DateFormat {
   static let FullDateHHMMSS = "yyyy-MM-dd HH:mm:ss"
   static let FullDateHHMM = "dd/MM/yyyy - HH:mm"
   static let FullDateHHMMSSZZZ = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSz"
   static let DDMMYYYY = "dd-MMM-yyyy"
   static let YYYY = "YYYY"
   static let MMMYYYY = "MMM YYYY"
}

enum ValidationMessages {
   static let EnableCamera = "Enable permissions to access your photos for sending photos."
  /*
  enum DonateNow {
    static let EnterAmount = "EnterAmountMsg".localized()
    static let EnterComment = "EnterCommentMsg".localized()
  }
  
  enum ContactUs {
    static let EnterName = "EnterName".localized()
    static let EnterEmail = "EnterEmail".localized()
    static let EnterValidEmail = "EnterValidEmail".localized()
    static let EnterMessage = "EnterMessage".localized()
  }
  
  enum ChangePassword {
    static let EnterOldPassword = "EnterOldPassword".localized()
    static let EnterNewPassword = "EnterNewPassword".localized()
    static let EnterConfirmPassword = "EnterConfirmPassword".localized()
    static let PasswordsNotMatched = "PasswordsNotMatched".localized()
  }
  
  enum ChatBot {
    static let EnterQueryMessage = "Please enter your message"
    static let NoSpeechDetected = "No speech voice detected. Please speak clearly into the microphone."
  }
  
  enum EditProfile {
    static let EnterGivenName = "EnterGivenName".localized()
    static let EnterFamilyName = "EnterFamilyName".localized()
    static let EnterPhoneNo = "EnterPhoneNo".localized()
  }
  
  enum AddBankAccount {
    static let EnterAccountHolderName = "EnterAccountHolderName".localized()
    static let AccountNameLimit = "AccountNameLimit".localized()
    static let AccountNumberLimit = "AccountNumberLimit".localized()
    static let EnterAccountNumber = "EnterAccountNumber".localized()
    static let EnterYourBankName = "EnterYourBankName".localized()
    static let EnterYourSwiftBic = "EnterYourSwiftBic".localized()
    static let BankNameLimit = "BankNameLimit".localized()
    static let SwiftBicLimit = "SwiftBicLimit".localized()
  }
  
  enum WithdrawFunds {
    static let EnterAmount = "EnterAmount".localized()
    static let MinAmountMessage = "MinAmountMessage".localized()
    static let MaxAmountMessage = "MaxAmountMessage".localized()
    static let SelectBankAccountMessage = "SelectBankAccountMessage".localized()
    static let InSufficientFund = "InSufficientFund".localized()
  }
  
  enum CreateReport {
    static let EnterSubject = AlertMsg.CUSTOMERSUPPORTSUBJECT.localized()
    static let EnterMessage = AlertMsg.CUSTOMERSUPPORTMESSAGE.localized()
  }
   */
}

enum Language {
   enum Name {
     static let English = "English"//.localized()
     static let German = "German"//.localized()
   }
   
   enum Code {
      static let English = "en"
      static let German = "de"
   }
}

enum TransactionStatus {
   static let Approved = "approved"
}

enum ActivityTitle {
   static let Deal = "Deal"
   static let Shop = "Shop"
   static let Date = "Date"
}

enum StoresTypes {
  static let All = "All"
  static let Trending = "Trending"
  static let New = "New"
}

enum DealsTypes {
  static let All = "All"
  static let Trending = "Trending"
  static let New = "New"
}


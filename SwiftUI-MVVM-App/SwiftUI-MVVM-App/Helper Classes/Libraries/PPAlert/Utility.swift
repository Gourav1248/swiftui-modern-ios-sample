//
//  Utility.swift
//  Squilio
//
//  Created by Admin on 12/01/24.
//

import Foundation
import UIKit

class Utility: NSObject {
  // MARK: - Email Validation -
  
  class func isValidEmail(strEmail : String) -> Bool {
    
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: strEmail)
  }
  class func isValidPassword(strPassword:String?) -> Bool {
    // least one uppercase,
    // least one digit
    // least one lowercase
    // least one symbol
    //  min 6 and max 100 characters total
    guard let strPassword = strPassword else { return false }
    let password = strPassword.trimmingCharacters(in: CharacterSet.whitespaces)
    let passwordRegx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#.])[A-Za-z\\d$@$!%*?&#.]{8,100}"
    let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
    return passwordCheck.evaluate(with: password)
    
  }
  
  class func isNameValid(strName:String?) -> Bool {
    
    guard let strName = strName else { return false }
    let name = strName.trimmingCharacters(in: CharacterSet.whitespaces)
    let nameRegx = "[A-Za-z]{2,100}"
    let nameCheck = NSPredicate(format: "SELF MATCHES %@",nameRegx)
    return nameCheck.evaluate(with: name)
    
  }
  class func isCardNumberValid(strNumber:String?) -> Bool {
    
    guard let strCardNo = strNumber else { return false }
    let cardNoRegx = "[0-9 ]{19}"
    let cardNoCheck = NSPredicate(format: "SELF MATCHES %@",cardNoRegx)
    return cardNoCheck.evaluate(with: strCardNo)
  }
  class func isAccountNumberValid(strNumber:String?) -> Bool {
    
    guard let strCardNo = strNumber else { return false }
    let cardNoRegx = "[0-9]{6,10}"
    let cardNoCheck = NSPredicate(format: "SELF MATCHES %@",cardNoRegx)
    return cardNoCheck.evaluate(with: strCardNo)
  }
  
  class func isBSBNumberValid(strNumber:String?) -> Bool {
    
    guard let strCardNo = strNumber else { return false }
    let cardNoRegx = "[0-9,-]{7,7}"
    let cardNoCheck = NSPredicate(format: "SELF MATCHES %@",cardNoRegx)
    return cardNoCheck.evaluate(with: strCardNo)
  }
  
  class func isPhoneNumberValid(strPhoneNo:String?) -> Bool {
    guard let strPhone = strPhoneNo else { return false }
    let number = strPhone.trimmingCharacters(in: CharacterSet.whitespaces)
    let numberRegx = "[0-9]{7,15}"
    let numberCheck = NSPredicate(format: "SELF MATCHES %@",numberRegx)
    return numberCheck.evaluate(with: number)
  }
  
  class func fullNameValid(strFullName:String?,isFullName:Bool = false) -> Bool{
    let characterset = CharacterSet(charactersIn: isFullName ? "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ " :"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    if strFullName?.rangeOfCharacter(from: characterset.inverted) == nil {
      dPrint("string contains special characters")
      return true
    }
    return false
  }
  
  
  
  class func numberPadValid(strNumberPad:String?,isAmount:Bool = false) -> Bool{
    
    let characterset = CharacterSet(charactersIn: isAmount ? "0123456789." : "0123456789")
    if strNumberPad?.rangeOfCharacter(from: characterset.inverted) == nil {
      dPrint("string contains special characters")
      return true
    }
    return false
  }
  
  
  
  class func getFormattedDateFromString(dateStr: String, withDateFormat: String) -> String {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    dateFormatterGet.locale = Locale(identifier: "en_US_POSIX")
    
    let dateFormatterPrint = DateFormatter()
    let calendar = Calendar.init(identifier: .gregorian)
    dateFormatterPrint.calendar = calendar
    dateFormatterPrint.dateFormat = withDateFormat
    
    let date: Date? = dateFormatterGet.date(from: dateStr)
    return dateFormatterPrint.string(from: date ?? Date.init())
  }
  
  class func getDateFromString(strDate: String, providerFormat: String, expectedFormat: String) -> String {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = providerFormat
    dateFormatterGet.locale = Locale(identifier: "en_US_POSIX")
    
    let dateFormatterPrint = DateFormatter()
    let calendar = Calendar.init(identifier: .gregorian)
    dateFormatterPrint.calendar = calendar
    dateFormatterPrint.dateFormat = expectedFormat
    
    let date: Date? = dateFormatterGet.date(from: strDate)
    return dateFormatterPrint.string(from: date ?? Date.init())
  }
  
  
  //
  
  static func isObjectOrValueAvailable(someObject: Any?) -> Any? {
    if someObject is String {
      
      if let someObject = someObject as? String {
        
        return someObject
      } else {
        
        return ""
      }
    } else if someObject is Array<Any> {
      
      if let someObject = someObject as? Array<Any> {
        
        return someObject
      } else {
        
        return []
      }
    } else if someObject is Dictionary<AnyHashable, Any> {
      
      if let someObject = someObject as? Dictionary<String, Any> {
        
        return someObject
      } else {
        
        return [:]
      }
    } else if someObject is Data {
      
      if let someObject = someObject as? Data {
        
        return someObject
      } else {
        
        return Data()
      }
    } else if someObject is NSNumber {
      
      if let someObject = someObject as? NSNumber{
        
        return someObject
      } else {
        
        return NSNumber.init(booleanLiteral: false)
      }
    } else if someObject is UIImage {
      
      if let someObject = someObject as? UIImage {
        
        return someObject
      } else {
        
        return UIImage()
      }
    } else {
      return ""
    }
  }
}

//MARK: - Decode JWT token code

func decode(jwtToken jwt: String) -> [String: Any] {
  let segments = jwt.components(separatedBy: ".")
  return decodeJWTPart(segments[1]) ?? [:]
}

func base64UrlDecode(_ value: String) -> Data? {
  var base64 = value
    .replacingOccurrences(of: "-", with: "+")
    .replacingOccurrences(of: "_", with: "/")
  
  let length = Double(base64.lengthOfBytes(using: String.Encoding.utf8))
  let requiredLength = 4 * ceil(length / 4.0)
  let paddingLength = requiredLength - length
  if paddingLength > 0 {
    let padding = "".padding(toLength: Int(paddingLength), withPad: "=", startingAt: 0)
    base64 = base64 + padding
  }
  return Data(base64Encoded: base64, options: .ignoreUnknownCharacters)
}

func decodeJWTPart(_ value: String) -> [String: Any]? {
  guard let bodyData = base64UrlDecode(value),
        let json = try? JSONSerialization.jsonObject(with: bodyData, options: []), let payload = json as? [String: Any] else {
    return nil
  }
  
  return payload
}


//
//  CommonEnum.swift
//  HealthLayby
//
//  Created by CMR010 on 23/05/23.
//

import Foundation
import UIKit

//MARK: - DateTime Format
enum DateAndTimeFormatString {
    static let yyyymmddhhmmss = "yyyy-MM-dd HH:mm:ss"
    static let MMMddyyyhhmmsssa = "MMM dd, yyyy hh:mm a"
    static let ddMMM = "dd MMM"
    static let ddMMMYYYY = "dd-MMM-YYYY"
    static let MMddYYYY = "MMM dd, yyyy"
    static let YYYYMMdd = "YYYY/MM/dd"
    static let YYYY_MM_dd = "YYYY-MM-dd"
}

//MARK: - Home Section
enum HomeSection: CaseIterable {
    case squilioBot
    case bannerSlider
    case shopWithCashbackTitle
    case shopWithCashback
    case specialAndVoucherTitle
    case specialAndVoucher
    case referAFriends
    case globalImpacts
    case recentSquirrellingsTitle
    case recentSquirrelings
}

struct AllSection {
  var name: String?
  var imgView: UIImage?
}

struct Section {
  static let Store = "Shop deals"
  static let Vouchers = "Vouchers"
  static let Donate = "Donate"
  static let Refer = "Invite friends"
}
//MARK: - Language Items
enum LanguageItems: String, CaseIterable {
    case en = "English"
    case de = "German"
}

struct CategoriesModel {
  var name: String = String()
  var icon: UIImage = UIImage()
  var id: Int = Int()
}

//MARK: - CMS Page Name
enum CMSPageName {
    case TERMSANDCONDITION, ABOUTUS, PRIVACYPOLICY
}

struct IMAGES {
    static let ICN_HOME_UNSELECTED                = UIImage(named: "ic_home_unselected")
    static let ICN_STORE_UNSELECTED               = UIImage(named: "ic_store_unselected")
    static let ICN_VOUCHER_UNSELECTED             = UIImage(named: "ic_voucher_unselected")
    static let ICN_DONATION_UNSELECTED            = UIImage(named: "faqs-icon")
    static let ICN_HOME_SELECTED                  = UIImage(named: "ic_home_selected")
    static let ICN_STORE_SELECTED                 = UIImage(named: "ic_store_selected")
    static let ICN_VOUCHER_SELECTED               = UIImage(named: "ic_voucher_selected")
    static let ICN_DONATION_SELECTED              = UIImage(named: "faqs-icon")
    static let ICN_PROFILE_SELECTED              = UIImage(named:  "ic_profile_selected")
    static let ICN_PROFILE_UNSELECTED           = UIImage(named:  "ic_profile_unselected")
    static let ICN_NESTOR_SELECTED              = UIImage(named:  "chat-icon")
    static let ICN_NESTOR_UNSELECTED              = UIImage(named:  "chat-icon")
    static let ICN_LANGUAGE_SELECTED              = UIImage(named: "ic_select_language")
    static let ICN_LANGUAGE_UNSELECTED            = UIImage(named: "ic_unselect_language")
    static let ICN_FILTER_SELECTED                = UIImage(named: "ic_select")
    static let ICN_FILTER_UNSELECTED              = UIImage(named: "ic_unselect")
    static let FilterSelected                = UIImage(named: "select-icon")
    static let FilterUnSelected              = UIImage(named: "unselect-icon")
    static let ICN_PLACEHOLDER_IMAGE              = UIImage(named: "store-voucher-placeholder")
    static let StoreVoucherPlaceholder              = UIImage(named: "store-voucher-placeholder")
    static let CategoryPlaceholder              = UIImage(named: "category-placeholder-icon")
    static let ICN_EYE_OPEN                       = UIImage(named: "icn_eye_open")
    static let ICN_EYE_CLOSE                      = UIImage(named: "icn_eye_close")
    static let ICN_FACEBOOK_LOGIN                 = UIImage(named: "icn_facebook_login")
    static let ICN_APPLE_LOGIN                    = UIImage(named: "icn_apple_login")
    static let ICN_GOOGLE_LOGIN                   = UIImage(named: "icn_google_login")
    static let ICN_FACEID                         = UIImage(named: "icn_faceId")
    static let ICN_PASSCODE                       = UIImage(named: "icn_passcode")
    static let ICN_FINGERPRINT                    = UIImage(named: "icn_fingerprint")
    static let ICN_LOGOUTPOPUP                    = UIImage(named: "icn_logout")
    static let ICN_DELETEACCOUNTPOPUP             = UIImage(named: "icn_delete_popup")
    static let ICN_CASHBACKSTATUSACTIVE           = UIImage(named: "cashback-active-icon")
    static let ICN_CASHBACKSTATUSINACTIVE         = UIImage(named: "cashback-inactive-icon")
    static let ICN_UNFAVOURITE                    = UIImage(named: "unfavorite-icon")
    static let ICN_FAVOURITE                      = UIImage(named: "favorite-icon")
    static let ICN_CLOSE                          = UIImage(named: "ic_close_grey")
    static let ICN_BACK                           = UIImage(named: "ic_back_black")
}




struct AlertMessage {
    
    
}




enum CMSPAGES: String {
    case aboutUs  = "About Us"
    case terms    = "Terms of Service"
    case privacy  = "Privacy Policy"
}

enum CMSPageValue {
   static let AboutUs = "about-us"
   static let TermsConditions = "terms-and-conditions"
   static let PrivacyPolicy = "privacy-policy"
}


enum SIDEMENU: String,CaseIterable {
    case howItWorks = "HowItWorks"
    case becomePartner = "BecomeAPartner"
    case contactUs = "ContactUs"
    case referAndEarn = "ReferAndEarn"
    case faq = "FAQs"
    case blogs = "Blogs"
    case changePassword = "Change Password"
    case myProfile         = "Profile"
    case aboutUs           = "About Us"
    case terms             = "Terms of Service"
    case privacyPolicy           = "Privacy Policy"
    case login             = "Login"
    case logout            = "Logout"
  case changeLanguage    =  "ChangeLanguage"
    case deleteAccount     = "Delete Account"
}


enum MyProfileMenu: String,CaseIterable {
    
    case editProfile       = "Personal Information"
    case userActivities    = "User Activities"
    case favourites        = "Favourites"
    case customerSupport   = "Customer Support"
    case notificationTitle = "Notification"
    case purchaseHistory   = "Purchase History"
    case reports           = "Reports"
    case biometricLogin    = "Biometric Login"
    case deleteAccount     = "Delete Account"
}


//MARK: - Redirection URL
struct REDIRECTIONURL {
    static let SIGNUPURL                    = "Sign Up URL"
    static let ABOUTUSURL                   = "About Us URL"
    static let TERMSANDCONDITIONURL         = "Terms URL"
    static let PRIVACYPOLICYURL             = "Privacy URL"
    static let DONATEURL                    = "Donate URL"
    static let GETMYCARDURL                 = "Get My Card URL"
}

struct INTEGER {
    static let TIMEDURATION = 30.0
}

enum ViewContent {
  enum Background {
    static let borderRadius = 35.0
  }
}

enum Categories{
  static let Fashion = "Fashion"
  static let Beauty = "Beauty"
  static let Electronics = "Electronics"
  static let Home = "Home"
  static let Travel = "Travel"
  static let Kids = "Kids"
  static let Foods = "Foods"
  static let Pets = "Pets"
  static let Education = "Education"
  static let Womens = "Womens & Girls"
  static let Environment = "Environment"
  static let Animal = "Animal"
  static let Local = "Local"
  static let Water = "Water"
  static let Climate = "Climate"
  static let Relief = "Relief"
}



struct ProfileSegment {
  var name: String = String()
  var isSelected: Bool = Bool()
}

//MARK: - Notification Type
enum NOTIFICATIONTYPE: String {
    case NEWVOUCHERS                     = "new_vouchers"
    case NEWDONATIONPROJECT              = "new_donation_project"
    case REPORTISSUE                     = "report_issue"
    case NEWSHOPS                        = "new_shops"
    case DONATIONMILESTONE               = "donation_milestone"
    case DONATIONRECIEVED                = "donation_received"
  case NewNewsLetter = "New_NewsLetter"
  case NewBlog = "New_Blog"
  case SpecificDeals = "Specific_Deals"
    case NewVouchers = "New_Vouchers"
}


struct EMPTYCELLMESSAGE {
    static let FAVOURITEEMPTY                        = "No more favourite available"
    static let REPORTISSUESEMPTY                     = "No more reports available"
    static let DEALSANDVOUCHERSEMPTY                 = "No more deals & vouchers available"
    static let STORESEMPTY                           = "No more store available"
}


enum BIOMETRICTYPE: String {
    case FACEID                          = "Face ID"
    case FINGERPRINT                     = "Fingerprint"
    case PASSCODE                        = "Passcode"
}

struct OnBoardingTexts {
  static let OnBoardingTitle1 = "OnBoardingTitle1"
  static let OnBoardingTitle2 = "OnBoardingTitle2"
  static let OnBoardingTitle3 = "OnBoardingTitle3"
  static let OnBoardingTitle4 = "OnBoardingTitle4"
  
  static let OnBoardingDescription1 = "OnBoardingDescription1"
  static let OnBoardingDescription2 = "OnBoardingDescription2"
  static let OnBoardingDescription3 = "OnBoardingDescription3"
  static let OnBoardingDescription4 = "OnBoardingDescription4"
}

struct FAQData {
  var title: String = String()
  var description: String = String()
  var isExpandable: Bool = Bool()
}

struct FAQDataKeys {
  static let title1 = "FAQTitle1"
  static let title2 = "FAQTitle2"
  static let title3 = "FAQTitle3"
  static let title4 = "FAQTitle4"
  static let title5 = "FAQTitle5"
  
  static let description1 = "FAQDescription1"
  static let description2 = "FAQDescription2"
  static let description3 = "FAQDescription3"
  static let description4 = "FAQDescription4"
  static let description5 = "FAQDescription5"
}

enum FavoriteList: CaseIterable {
  case Stores
  case Vouchers
  case Contributions
  
  //init() {}
}

let strTerminator = "\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\n\n"

func dPrint(_ items: Any..., separator: String = " ", terminator: String = strTerminator) {
#if DEBUG
  Swift.print(items, separator: separator, terminator: terminator)
#endif
}

func dPrintProperties<T>(strProperty: String = "", _ object: T) {
  let mirror = Mirror(reflecting: object)
  dPrint("🔍 \(strProperty) \(type(of: object)) Properties:\n")
  for child in mirror.children {
    if let label = child.label {
#if DEBUG
      Swift.print("\(label): \(child.value)")
#endif
    }
  }
}

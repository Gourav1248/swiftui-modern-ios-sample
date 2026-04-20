//
//  WebServiceRequest.swift
//  Squilio-iOS
//
//  Created by Gourav Joshi on 01/02/26.
//

import Foundation

enum Environment {
  case dev, stage, prod
}

struct Server {
  
  static var environment: Environment = .dev
  
  private init() {}
  
  enum Scheme {
    static let Name = "https://"
  }
  
  enum HostName {
    // https://devcmssquilio.thumbstack.dev/
    static let Dev = "api.example.dev"
    static let Live = "api.example.com"
  }
  
  enum Path {
    static let Dev = "/api/"
    static let Live = "/api/"
  }
  
  enum API {
    static let DevUrl = String(format: "%@%@%@", Server.Scheme.Name, Server.HostName.Dev, Server.Path.Dev)
    static let LiveUrl = String(format: "%@%@%@", Server.Scheme.Name, Server.HostName.Live, Server.Path.Live)
  }
  
  enum BotServer {
    enum HostName {
      static let Dev = "bot-dev.ld4yeb.easypanel.host"
      static let Live = "bot.ld4yeb.easypanel.host"
    }
    
    enum API {
      static let DevUrl = String(format: "%@%@%@query", Server.Scheme.Name, BotServer.HostName.Dev, Server.Path.Dev)
      static let LiveUrl = String(format: "%@%@%@query", Server.Scheme.Name, BotServer.HostName.Live, Server.Path.Live)
    }
  }
  
  static var BaseUrl: String {
    switch environment {
    case .dev:
      return Server.API.DevUrl
    case .stage:
      return Server.API.DevUrl
    case .prod:
      return Server.API.LiveUrl
    }
  }
}

struct APIRouter {
  
  enum UserStories {
    static let Registration = "auth/local/register"
    static let Login = "users/auth/login"
    static let ForgotPassword = "auth/forgot-password"
    static let ResetPassword = "auth/reset-password"
    static let SocialLogin = "users/social-callback"
    static let DeleteAccount = "users/delete-account"
    static let ChangePassword = "auth/change-password"
  }
  
  enum Home {
    static let All = "app-home?"
  }
  
  enum Stores {
    static let All = "stores?"
    static let Detail = "stores/"
    static let Categories = "store-categories?"
    static let Tags = "store-tags?"
    static let DealsAndVouchers = "store-deals-and-vouchers?"
    static let SetFavorite = "store/wishlist/toggle"
    static let FavoriteList = "store/wishlist/list?"
    static let SimilarStores = "stores?"
    static let BannerSlider = "app-banner-slider?"
    static let StoreRedirect = "store/redirect?"
    static let Locations = "store/locations"
  }
  
  enum Contributions {
    static let All = "donation-projects?"
    static let Details = "donation-projects/"
    static let Categories = "donation-categories?"
  }
  
  enum DealsAndVouchers {
    static let All = "store-deals-and-vouchers?"
    static let FavoriteList = "voucher/wishlist/list?"
    static let Details = "store-deals-and-vouchers/"
    static let SetFavorite = "voucher/wishlist/toggle"
    static let BannerSlider = "app-banner-slider?"
    static let Categories = "voucher-categories?"
    static let DealsRedirect = "deals/redirect?"
  }
  
  enum Filters {
    static let Stores = "store/filter-handles"
    static let Vouchers = "deals/filter-handles"
  }
  
  enum Bot {
    static let Request = "query"
    static let TextToSpeech = "speech/text-to-speech"
  }
  
  enum Others {
    static let ContactUs = "contact-requests"
  }
  
  enum Profile {
    static let MyProfile = "users/my-profile"
    static let UpdateProfile = "users/update-profile"
    static let MyActivities = "activity/my-activity"
  }
  
  enum Payouts {
    static let RequestPayout = "payout/request-payout"
    static let MyPayoutList = "payout/my-payout"
    static let MyTransaction = "activity/my-transaction"
  }
  
  enum Banking {
    static let MyBankAccount = "users/my-bank-account"
    static let AddBankAccount = "users/add-bank-account"
  }
  
  enum ReportIssue {
    static let CreateReport = "users/add-dispute-report"
    static let ReportList = "users/my-dispute-reports"
  }
  
  enum Security {
    static let SetPin = "users/set-pin"
    static let VerifyPin = "users/verify-pin"
    static let ForgotPin = "users/initiate-pin-forget"
    static let ValidateOTP = "users/validate-email-pin"
  }
  
  enum ReferAndEarn {
    static let ApplyReferralLink = "users/link-referd-user"
    static let ReferStats = "users/refer-stats"
    static let SendInvite = "users/send-invite-link"
  }
}

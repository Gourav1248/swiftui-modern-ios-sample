//
//  WebServiceHeaders.swift
//  Squilio-iOS
//
//  Created by Gourav Joshi on 02/02/26.
//

struct WebServiceHeaders {
  
  static var authorized: [String: String] {
    [
      "Authorization": "Bearer \(UserDefaultHelper.acessToken)",
      "Accept-Language": UserDefaultHelper.selectedLanguage,
      "Accept": "application/json"
    ]
  }
  
  static let general: [String: String] = [
    "Accept-Language": UserDefaultHelper.selectedLanguage,
    "Accept": "application/json"
  ]
}

enum NetworkError: Error {
  case noInternet
  case unauthorized
  case forbidden
  case decodingFailed
  case serverError(String)
  case notFound
  case decodingError 
  case unknown
}


//
//  ErrorHandler.swift
//  Squilio-iOS
//
//  Created by Gourav Joshi on 02/02/26.
//

final class ErrorHandler {
    static let shared = ErrorHandler()
    
    private init() {}
    
    func handle(_ error: Error) {
        switch error {
        case NetworkError.noInternet:
            PPAlerts().showAlert(with: .adefault, withMessage: "no Internet")
            
        case let networkError as NetworkError:
          PPAlerts().showAlert(with: .adefault, withMessage: "Network error")
            
        default:
          PPAlerts().showAlert(with: .adefault, withMessage: "Other issue")  
            print("Unhandled Error: \(error)")
        }
    }
}

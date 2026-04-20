//
//  FireBaseRemoteConfig.swift
//  Squilio
//
//  Created by Admin on 31/01/24.
//

import Foundation
import UIKit

extension Bundle {
    //1
    static var appVersionBundle: String {
        guard
            let info = Bundle.main.infoDictionary,
            let version = info["CFBundleShortVersionString"] as? String
            else { return "" }
        return version
    }

    //2
    static var appBuildBundle: String {
        guard
            let info = Bundle.main.infoDictionary,
            let version = info["CFBundleVersion"] as? String
            else { return "" }
        return version
    }
}





extension UIApplication {
    func openAppStore(for appID: String) {
        let appStoreURL = "https://apps.apple.com/ch/app/Squilio/id\(appID)"
        guard let url = URL(string: appStoreURL) else {
            return
        }

        DispatchQueue.main.async {
            if self.canOpenURL(url) {
                self.open(url)
            }
        }
    }
}

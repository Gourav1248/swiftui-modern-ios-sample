//
//  KeychainManager.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 14/07/26.
//

import Foundation
import Security

enum KeychainKeys {

   static let accessToken = "accessToken"
   static let refreshToken = "refreshToken"

}


final class KeychainManager {

   static let shared = KeychainManager()

   private init() {}

   // MARK: - Save

   @discardableResult
   func save(value: String, forKey key: String) -> Bool {

      let data = Data(value.utf8)

      let query: [String: Any] = [
         kSecClass as String: kSecClassGenericPassword,
         kSecAttrAccount as String: key,
         kSecValueData as String: data
      ]

      // Delete existing value if any
      SecItemDelete(query as CFDictionary)

      let status = SecItemAdd(query as CFDictionary, nil)

      return status == errSecSuccess
   }

   // MARK: - Fetch

   func fetchValue(forKey key: String) -> String? {

      let query: [String: Any] = [

         kSecClass as String: kSecClassGenericPassword,
         kSecAttrAccount as String: key,

         kSecReturnData as String: true,
         kSecMatchLimit as String: kSecMatchLimitOne
      ]

      var result: AnyObject?

      let status = SecItemCopyMatching(query as CFDictionary, &result)

      guard status == errSecSuccess,
            let data = result as? Data else {
         return nil
      }

      return String(data: data, encoding: .utf8)
   }

   // MARK: - Update

   @discardableResult
   func update(value: String, forKey key: String) -> Bool {

      let data = Data(value.utf8)

      let query: [String: Any] = [
         kSecClass as String: kSecClassGenericPassword,
         kSecAttrAccount as String: key
      ]

      let attributes: [String: Any] = [
         kSecValueData as String: data
      ]

      let status = SecItemUpdate(query as CFDictionary,
                                 attributes as CFDictionary)

      return status == errSecSuccess
   }

   // MARK: - Delete

   @discardableResult
   func deleteValue(forKey key: String) -> Bool {

      let query: [String: Any] = [

         kSecClass as String: kSecClassGenericPassword,
         kSecAttrAccount as String: key

      ]

      let status = SecItemDelete(query as CFDictionary)

      return status == errSecSuccess
   }

   // MARK: - Exists

   func contains(key: String) -> Bool {
      return fetchValue(forKey: key) != nil
   }

}

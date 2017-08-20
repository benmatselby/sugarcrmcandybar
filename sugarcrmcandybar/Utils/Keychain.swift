//
//  Keychain.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 13/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation
import Security

/// Responsible for talking to the Keychain Services
class Keychain
{
    /// Get the password from the keychain server
    ///
    /// - Parameters:
    ///   - url: The URL the password links to
    ///   - identifier: The identifier for the item in the Keychain
    /// - Returns: The password
    public static func getPassword(url: String, identifier: String) -> String
    {
        var returnPassword: String = ""
        let query = [
            kSecAttrAccount as String : url,
            kSecAttrService as String : Bundle.main.bundleIdentifier ?? "",
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccessible as String : kSecAttrAccessibleAlways,
            kSecReturnData as String : true,
            kSecMatchLimit as String : kSecMatchLimitOne
            ] as [String : Any]

        var result: CFTypeRef?
        SecItemCopyMatching(query as CFDictionary, &result)

        if let result = result as? Data,
            let password = String(data: result, encoding: String.Encoding.utf8) {
            returnPassword = password
        }

        return returnPassword
    }

    /// Set the password in the Keychain
    ///
    /// - Parameters:
    ///   - url: The URL the password links to
    ///   - password: The password
    ///   - identifier: The identifier for the item in the Keychain
    public static func setPassword(url: String, password: String, identifier: String)
    {
        let passwordData = password.data(using: String.Encoding.utf8)
        var attributes = [String : Any]()

        let query = [
            kSecAttrAccount as String : url,
            kSecAttrService as String : identifier,
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccessible as String : kSecAttrAccessibleAlways
            ] as [String : Any]

        var status = SecItemCopyMatching(query as CFDictionary, nil)

        switch status {
        case errSecSuccess:
            attributes[kSecValueData as String] = passwordData
            status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        case errSecItemNotFound:
            var query = query
            query[kSecValueData as String] = passwordData
            status = SecItemAdd(query as CFDictionary, nil)
        default: break
        }
    }
}

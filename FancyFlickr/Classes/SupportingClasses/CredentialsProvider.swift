//
//  CredentialsProvider.swift
//  FancyFlickr
//
//  Created by Roman Osadchuk on 2/5/17.
//  Copyright © 2017 Osadchuk. All rights reserved.
//

import Foundation

struct CredentialKeys {
    static let tokenKey = "token"
    static let fullname = "fullname"
    static let nsid = "nsid"
    static let username = "username"
}

class CredentialsProvider {
    
    static private let defaults = UserDefaults.standard

    static var token: String? {
        set {
            CredentialsProvider.defaults.set(newValue, forKey: CredentialKeys.tokenKey)
        }
        get {
            return CredentialsProvider.defaults.string(forKey: CredentialKeys.tokenKey)
        }
    }
    
}

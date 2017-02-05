//
//  FlickrConstants.swift
//  FancyFlickr
//
//  Created by Roman Osadchuk on 2/4/17.
//  Copyright © 2017 Osadchuk. All rights reserved.
//

import Foundation

struct FlickrAPIConstants {
    static let key = "380622474a2ce2496a718409fe93fc8d"
    static let secret = "2ce07550fdfadeba"
    static let callbackScheme = "fancyflickr"

    static let endpoint = "https://api.flickr.com/services"
    
    enum QueryItems: String {
        case authQueryItem = "auth"
        case restQueryItem = "rest"
    }
    
    enum Methods: String {
        case getToken = "flickr.auth.getToken"
        case getInterestingnessList = "flickr.interestingness.getList"
    }
}

struct ParameterKey {
    static let apiKey = "api_key"
    static let permsKey = "perms"
    static let apiSigKey = "api_sig"
    static let frob = "frob"
    static let method = "method"
    static let format = ("format", "json")
    static let nojsoncallback = ("nojsoncallback", "1")
}

enum Permission: String {
    case Write = "write"
    case Read = "read"
    case Delete = "delete"
}

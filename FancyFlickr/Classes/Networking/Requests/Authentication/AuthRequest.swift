//
//  AuthRequest.swift
//  FancyFlickr
//
//  Created by Roman Osadchuk on 2/5/17.
//  Copyright © 2017 Osadchuk. All rights reserved.
//

import Foundation
import Alamofire

class AuthRequest {
    
    func flickrAuthRequest() -> URLRequest {
        
        let url = URL(string: FlickrAPIConstants.endpoint + "/" + FlickrAPIConstants.QueryItems.authQueryItem.rawValue + "/")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 20)
        
        let apiSig = FlickrAPIConstants.secret +
            ParameterKey.apiKey + FlickrAPIConstants.key +
            ParameterKey.permsKey + Permission.Read.rawValue
        let apiSigEncrypted = apiSig.md5
        
        let parameters: [String : String] = [ParameterKey.apiKey : FlickrAPIConstants.key,
                                             ParameterKey.permsKey : Permission.Read.rawValue,
                                             ParameterKey.apiSigKey : apiSigEncrypted!]
        request = try! URLEncoding.default.encode(request, with: parameters)
        
        return request
    }
    
}

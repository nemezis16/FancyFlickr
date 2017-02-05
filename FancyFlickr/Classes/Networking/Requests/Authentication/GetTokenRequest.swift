//
//  GetTokenRequest.swift
//  FancyFlickr
//
//  Created by Roman Osadchuk on 2/5/17.
//  Copyright © 2017 Osadchuk. All rights reserved.
//

import Foundation
import Alamofire

class GetTokenRequest {
    
    func flickrGetTokenRequest(from schemeURL: URL) -> URLRequest {
        let queryItems = URLComponents(url: schemeURL, resolvingAgainstBaseURL: true)?.queryItems
        let frobQueryItem = queryItems?.filter({$0.name == ParameterKey.frob}).first
        let frob: String! = frobQueryItem?.value
        
        let requestURL = URL(string: FlickrAPIConstants.endpoint + "/" + FlickrAPIConstants.QueryItems.restQueryItem.rawValue + "/")!
        var request = URLRequest(url: requestURL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 20)
        
        let apiSig = FlickrAPIConstants.secret +
            ParameterKey.apiKey + FlickrAPIConstants.key +
            ParameterKey.format.0 + ParameterKey.format.1 +
            ParameterKey.frob + frob +
            ParameterKey.method + FlickrAPIConstants.Methods.getToken.rawValue +
            ParameterKey.nojsoncallback.0 + ParameterKey.nojsoncallback.1 +
            ParameterKey.permsKey + Permission.Read.rawValue
        
        let apiSigEncrypted = apiSig.md5
        
        let parameters: [String : String] = [ParameterKey.apiKey : FlickrAPIConstants.key,
                                             ParameterKey.permsKey : Permission.Read.rawValue,
                                             ParameterKey.apiSigKey : apiSigEncrypted!,
                                             ParameterKey.frob : frob,
                                             ParameterKey.format.0 : ParameterKey.format.1,
                                             ParameterKey.nojsoncallback.0 : ParameterKey.nojsoncallback.1,
                                             ParameterKey.method : FlickrAPIConstants.Methods.getToken.rawValue]
        request = try! URLEncoding.default.encode(request, with: parameters)
        
        return request
    }
    
}

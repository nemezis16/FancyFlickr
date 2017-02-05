//
//  GetPhotosRequest.swift
//  FancyFlickr
//
//  Created by Roman Osadchuk on 2/5/17.
//  Copyright © 2017 Osadchuk. All rights reserved.
//

import Foundation
import Alamofire

class GetPhotosRequest {
    
    func flickrGetPhotosRequest() -> URLRequest {
        
        let url = URL(string: FlickrAPIConstants.endpoint + "/" + FlickrAPIConstants.QueryItems.restQueryItem.rawValue + "/")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 20)
       
        
        let parameters: [String : String] = [ParameterKey.apiKey : FlickrAPIConstants.key,
                                         
                                             ParameterKey.format.0 : ParameterKey.format.1,
                                             ParameterKey.nojsoncallback.0 : ParameterKey.nojsoncallback.1,
                                             ParameterKey.method : FlickrAPIConstants.Methods.getInterestingnessList.rawValue]
        
        request = try! URLEncoding.default.encode(request, with: parameters)
        
        return request
    }
    
}

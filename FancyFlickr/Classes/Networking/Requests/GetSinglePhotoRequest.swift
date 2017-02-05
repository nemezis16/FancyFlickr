//
//  GetSinglePhotoRequest.swift
//  FancyFlickr
//
//  Created by Roman Osadchuk on 2/5/17.
//  Copyright © 2017 Osadchuk. All rights reserved.
//

import Foundation

import ObjectMapper

class GetSinglePhotoRequest: Mappable {
    
    var id: String?
    var farm: Int?
    var secret: String?
    var server: String?
    var title: String?
    var owner: String?

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        farm <- map["farm"]
        secret <- map["secret"]
        server <- map["server"]
        title <- map["title"]
        owner <- map["owner"]
    }
    
    func getSinglePhotoRequest() -> URLRequest? {
    
        guard let farm = farm, let server = server, let id = id, let secret = secret else { return nil }
        
        let urlString = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 20)
        return request
    }

}

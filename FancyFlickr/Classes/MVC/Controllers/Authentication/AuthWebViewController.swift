//
//  AuthWebViewController.swift
//  FancyFlickr
//
//  Created by Roman Osadchuk on 2/4/17.
//  Copyright © 2017 Osadchuk. All rights reserved.
//

import UIKit
import Alamofire

struct ParameterKey {
    static let apiKey = "api_key"
    static let permsKey = "perms"
    static let apiSigKey = "api_sig"
    static let frob = "frob"

}

enum Permission: String {
    case Write = "write"
    case Read = "read"
    case Delete = "delete"
}

class AuthWebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onCallbackNotificationTriggered(notification:)), name: NSNotification.Name.OnFlickrAuthCallback, object: nil)
        
        
        let url = URL(string: FlickrAPIConstants.endpoint + "/" + FlickrAPIConstants.authQueryItemKey + "/")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let apiSig = FlickrAPIConstants.secret +
            ParameterKey.apiKey + FlickrAPIConstants.key +
            ParameterKey.permsKey + Permission.Read.rawValue
        let apiSigEncrypted = apiSig.md5
        
        let parameters: [String : String] = [ParameterKey.apiKey : FlickrAPIConstants.key,
                          ParameterKey.permsKey : Permission.Read.rawValue,
                          ParameterKey.apiSigKey : apiSigEncrypted!]
        request = try! URLEncoding.default.encode(request, with: parameters)
        
        webView.loadRequest(request)
    }
    
//MARK: - Notifications
    
    func onCallbackNotificationTriggered(notification: Notification) {
        guard let url = notification.object as? URL else {
            return
        }
        
        let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems
        let frobQueryItem = queryItems?.filter({$0.name == ParameterKey.frob}).first
        let frob = frobQueryItem?.value
    }
    
}

extension AuthWebViewController: UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
    }
    
}

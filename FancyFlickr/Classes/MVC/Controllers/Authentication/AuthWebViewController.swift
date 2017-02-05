//
//  AuthWebViewController.swift
//  FancyFlickr
//
//  Created by Roman Osadchuk on 2/4/17.
//  Copyright © 2017 Osadchuk. All rights reserved.
//

import UIKit
import Alamofire

class AuthWebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onCallbackNotificationTriggered(notification:)), name: NSNotification.Name.OnFlickrAuthCallback, object: nil)
        
        webView.loadRequest(AuthRequest().flickrAuthRequest())
    }
    
//MARK: - Notifications
    
    func onCallbackNotificationTriggered(notification: Notification) {
        guard let url = notification.object as? URL else {
            return
        }
        let request = GetTokenRequest().flickrGetTokenRequest(from: url)
        Alamofire.request(request).responseJSON { response in
            if let JSON = response.result.value as? [String : Any] {
                print("JSON: \(JSON)")
                
                guard let auth = JSON["auth"] as? [String : Any] else {
                    return
                }
                guard let token = auth["token"] as? [String : Any] else {
                    return
                }
                guard let tokenContent = token["_content"] as? String else {
                    return
                }
                CredentialsProvider.token = tokenContent
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let controller = storyboard.instantiateInitialViewController() {
                    self.present(controller, animated: true, completion: nil)
                }
            }
        }
    }
}

extension AuthWebViewController: UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
    }
    
}

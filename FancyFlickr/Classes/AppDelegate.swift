//
//  AppDelegate.swift
//  FancyFlickr
//
//  Created by Roman Osadchuk on 2/4/17.
//  Copyright © 2017 Osadchuk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        return true
    }

  
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if (url.scheme == FlickrAPIConstants.callbackScheme) {
            NotificationCenter.default.post(name: NSNotification.Name.OnFlickrAuthCallback, object: url)
            return true
        }
        
        return false
    }

}


//
//  AuthViewController.swift
//  FancyFlickr
//
//  Created by Roman Osadchuk on 2/4/17.
//  Copyright © 2017 Osadchuk. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
  
    @IBOutlet weak var signInButton: UIButton!
    
//MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.signInButton.layer.cornerRadius = self.signInButton.frame.height / 2
    }
    
//MARK: - Action
    
    @IBAction func handleSignInTap(_ sender: UIButton) {
        
    }
    
}

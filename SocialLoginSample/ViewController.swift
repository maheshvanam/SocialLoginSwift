//
//  ViewController.swift
//  SocialLoginSample
//
//  Created by admin on 17/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit
class ViewController: UIViewController  {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    let fbSignInButton = FBLoginButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        fbSignInButton.center = view.center
        view.addSubview(fbSignInButton)

        if let token = AccessToken.current,
            !token.isExpired {
            print("User is logged in, do work such as go to next view controller.")
        }
        fbSignInButton.permissions =  ["public_profile", "email"]
    }
}


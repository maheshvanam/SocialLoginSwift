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
class ViewController: UIViewController,LoginButtonDelegate {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    let fbSignInButton = FBLoginButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        fbSignInButton.center = view.center
        view.addSubview(fbSignInButton)
        fbSignInButton.delegate = self
        if let token = AccessToken.current,
            !token.isExpired {
            let home = storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
            navigationController?.present(home, animated: true, completion: nil)
        }
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if ((error) != nil) {
            print(error!.localizedDescription)
        }
        else if result!.isCancelled {
            print("Cancelled")
        }
        else {
            let homeViewController = storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
            homeViewController.modalPresentationStyle = .fullScreen
            present(homeViewController, animated: true, completion: nil)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("logOut")
    }
    
}


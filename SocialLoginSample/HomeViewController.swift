//
//  HomeViewController.swift
//  SocialLoginSample
//
//  Created by admin on 17/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import GoogleSignIn
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onSigOutTapped(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signOut()
        
        let loginViewController = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: false, completion: nil)
    }
}

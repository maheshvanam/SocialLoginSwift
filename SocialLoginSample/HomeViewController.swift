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
    }
}

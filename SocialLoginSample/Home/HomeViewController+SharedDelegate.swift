//
//  HomeViewController+SharedDelegate.swift
//  SocialLoginSample
//
//  Created by admin on 19/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import FBSDKShareKit
extension HomeViewController: SharingDelegate{
    func sharer(_ sharer: Sharing, didCompleteWithResults results: [String : Any]) {
        print("success")
    }
    
    func sharer(_ sharer: Sharing, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func sharerDidCancel(_ sharer: Sharing) {
        print("cancel")
    }
}

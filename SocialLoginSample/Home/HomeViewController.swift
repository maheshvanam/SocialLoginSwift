//
//  HomeViewController.swift
//  SocialLoginSample
//
//  Created by admin on 17/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit
import FBSDKShareKit
class HomeViewController: UIViewController {
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSigOutTapped(_ sender: Any) {
        if GIDSignIn.sharedInstance()?.currentUser != nil {
            GIDSignIn.sharedInstance()?.signOut()
        } else {
            LoginManager().logOut()
        }
        let loginViewController = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: false, completion: nil)
    }
    
    @IBAction func didShareTapped(_ sender: Any) {
        sharePhoto()
    }
    
    func sharePhoto() {
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func didShareLinkTapped(_ sender: Any) {
        let shareLinkContent = ShareLinkContent()
        shareLinkContent.contentURL = URL(string:"https://developers.facebook.com")!
        let dialog = ShareDialog(fromViewController: self, content: shareLinkContent, delegate: self)
        
        print("AccessToken at shareLink: ",AccessToken.current?.tokenString)
        dialog.show()
    }
}

extension HomeViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            dismiss(animated: true) {
                let sharePhoto = SharePhoto()
                sharePhoto.image = image
                let content = SharePhotoContent()
                content.photos = [sharePhoto]
                let dialog = ShareDialog(fromViewController: self, content: content, delegate: self)
                print("AccessToken at photo: ",AccessToken.current?.tokenString)
                dialog.show()
                
            }
        }
    }
}

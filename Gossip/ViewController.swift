//
//  ViewController.swift
//  Gossip
//
//  Created by 尾之上翼 on 2017/09/23.
//  Copyright © 2017年 Goissip. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKShareKit
import FBSDKCoreKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

  @IBOutlet weak var backgroundImageView: UIImageView!
  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var button: UIButton!
  var user: User!
  var ref: DatabaseReference!
  private var databaseHandle: DatabaseHandle!
  
  let facebookLoginButton = FBSDKLoginButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setObjects()
    user = Auth.auth().currentUser
    ref = Database.database().reference()
    print("Debug------------",ref.child("users").accessibilityElementCount())
  }
  
  func setObjects() {
    button.setTitle("FaceBookでログイン", for: .normal)
    button.setTitleColor(UIColor.black, for: .normal)
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.borderWidth  = 1
    button.layer.cornerRadius = 10
    button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    
    facebookLoginButton.layer.position.x = myWidth/2
    facebookLoginButton.frame.origin.y = myHeight  - 100
    facebookLoginButton.delegate = self
    
    view.addSubview(facebookLoginButton)
    
    logoImageView.image = #imageLiteral(resourceName: "logo")
    logoImageView.contentMode = .scaleAspectFit
  }
  
  
  
  @objc func tapButton() {
    let loginManager: FBSDKLoginManager = FBSDKLoginManager()
    loginManager.logIn(withReadPermissions: ["public_profile", "email", "user_friends"], from: self) { [weak self] (result, error) in
      if (error != nil) {
        print("Process error")
      } else if (result?.isCancelled)! {
        print("Cancelled")
      } else {
        print("Login Succeeded")
        self?.moveMainVC()
      }
    }
  }
  
  func moveMainVC() {
    let mainVC = MainViewController()
    
    if let window = UIApplication.shared.keyWindow {
      window.rootViewController = mainVC
    }
  }
  
  func loginFireBase(with credential: AuthCredential) {
    
    Auth.auth().signIn(with: credential) { (user, error) in
      if let error = error {
        // ...
        return
      }
      self.moveMainVC()
    }
    
  }
  
}

extension ViewController: FBSDKLoginButtonDelegate {
  
  func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
    
    if let error = error {
      print(error.localizedDescription)
      return
    }
    
    let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        loginFireBase(with: credential)
        print("Debug------------",ref.child("users").accessibilityElementCount())
    }
  
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}


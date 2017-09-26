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

class ViewController: UIViewController {

  @IBOutlet weak var backgroundImageView: UIImageView!
  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var button: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setObjects()
  }
  
  func setObjects() {
    button.setTitle("FaceBookでログイン", for: .normal)
    button.setTitleColor(UIColor.black, for: .normal)
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.borderWidth  = 1
    button.layer.cornerRadius = 10
    button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    
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
  
}


//
//  MainViewController.swift
//  Gossip
//
//  Created by 尾之上翼 on 2017/09/23.
//  Copyright © 2017年 Goissip. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit


class MainViewController: UIViewController {
  
  let mainView = MainView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view = mainView
  }
  
  func getFacebookInfomation() {
//    let graphRequest: FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id,email,gender,link,locale,name,timezone,updated_time,verified,last_name,first_name,middle_name"])
//
//    graphRequest.start(completionHandler: { (connection, result, error) -> Void in
//
//      if ((error) != nil)
//      {
//        // Process error
//        print("Error: \(error)")
//      }
//      else
//      {
//        print("fetched user: \(result)")
//
//
//        // 個々の情報を取得したいときはこんな感じ
//
//      }
//    })
    
    
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

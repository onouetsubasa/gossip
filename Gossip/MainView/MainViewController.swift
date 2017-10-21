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
import Firebase
import ObjectMapper
import FirebaseDatabase

struct Friends {
  var id: String
  var name: String
}

struct Fri {
  var name: String!
  var image: String!
}

class MainViewController: UIViewController {
  
  let mainView = MainView()
    var ref: DatabaseReference!
    private var databaseHandle: DatabaseHandle!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view = mainView
    checkAuth()
  }
  
  func checkAuth() {
    
    let privateUser = Auth.auth().currentUser
    
    guard let user = privateUser else {
      
      DispatchQueue.main.async(execute: {
        self.moveLoginVC()
      })
      
      return
    }
    newUser(newuser: user)
    getFacebookInfomation()
    
  }
  
  func moveLoginVC() {
    
    if let window = UIApplication.shared.keyWindow {
      let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
      let nextVC = storyboard.instantiateInitialViewController()
      window.rootViewController = nextVC
    }
  }
  
  var dict  = [AnyObject]()
  var friendInfo = [Fri]()
  
  func getFacebookInfomation() {
    
    var params = ["fields": "id, name, picture.type(large)"]
    params["limit"] = "10"
    let graphRequest = FBSDKGraphRequest(graphPath: "me/taggable_friends", parameters: params)
    let connection = FBSDKGraphRequestConnection()
    connection.add(graphRequest, completionHandler: { [weak self] (connection, result, error) in
      
      guard let `self` = self else { return }
      
      if error == nil {
        
        if let jsonResult = result as? Dictionary<String,AnyObject> {
          
          self.dict = jsonResult["data"] as! [AnyObject]
          
          for item in self.dict
          {
            // let id = item["id"] as! String
            let name = item["name"] as! String
            let picture = item["picture"] as! NSDictionary
            let parsePic = picture["data"] as! NSDictionary
            let url = parsePic["url"] as! String
            
            let f = Fri(name: name, image: url)
            self.friendInfo.append(f)
          }
          
          self.mainView.friendInfos = self.friendInfo
        }
        
      } else {
        print("Error Getting Friends \(error)");
      }
      
    })
    
    connection.start()
    
  }
    
    func newUser(newuser: User) {
        ref = Database.database().reference()
        ref.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            if let x = value?[newuser.uid]{
                print("---------------------1debug-------------: Already signed up",value?[newuser.uid])
            }else{
                self.ref.child("users").child(newuser.uid).setValue(["name":newuser.displayName])
                print("---------------------1debug-------------: New user created", newuser)
            }

        }) { (error) in
            print(error.localizedDescription)
        }
    }

}

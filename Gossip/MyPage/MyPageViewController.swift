//
//  MyPageViewController.swift
//  Gossip
//
//  Created by 尾之上翼 on 2017/10/22.
//  Copyright © 2017年 Goissip. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
  
  var gossip = ["一番優しい人", "一番な人", "一番気まま人", "一番な人", "一番混んでる人", "一番起こる人", "一番悲しい人", "一番怖いい人"]
  
  let myView = MyPageView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view = myView
    myView.gossip = self.gossip
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

//
//  FriendDetailViewController.swift
//  Gossip
//
//  Created by 尾之上翼 on 2017/10/21.
//  Copyright © 2017年 Goissip. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
  
  var info: String!
  let friendDetailView: FriendDetailView?
  var gossip = ["一番優しい人", "一番な人", "一番気まま人", "一番悪しゅう漂ってる人", "一番な人", "一番混んでる人", "一番起こる人", "一番悲しい人", "一番怖いい人"]
  
  init(friendInfo: String) {
    self.info = friendInfo
    friendDetailView = FriendDetailView(info: friendInfo)
    
    super.init(nibName: nil, bundle: nil)
    view = friendDetailView!
    friendDetailView?.gossip = gossip
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

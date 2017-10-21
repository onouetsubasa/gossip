//
//  FriendViewController.swift
//  Gossip
//
//  Created by 尾之上翼 on 2017/10/21.
//  Copyright © 2017年 Goissip. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {
  
  let friends = ["田中太郎", "田中1郎", "田中2郎", "田中3郎", "田中4郎", "田中5郎", "田中6郎","田中7郎" ,"田中8郎"]
  
  private let friendView = FriendView()
  
  override func loadView() {
    super.loadView()
    
    friendView.delegate = self
    view = friendView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    friendView.friends = friends
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

extension FriendViewController: FriendViewDelegate {
  
  func showFriendDetailVC(info: String) {
    let friendDetailVC = FriendDetailViewController(friendInfo: info)
    present(friendDetailVC, animated: true, completion: nil)
  }
}




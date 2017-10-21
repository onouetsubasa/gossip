//
//  FriendDetailCollectionViewCell.swift
//  Gossip
//
//  Created by 尾之上翼 on 2017/10/21.
//  Copyright © 2017年 Goissip. All rights reserved.
//

import UIKit

class FriendDetailCollectionViewCell: UICollectionViewCell {
  
  private let gossipLabel: UILabel = {
    let label = UILabel()
    label.frame = CGRect(x: 16, y: 0, width: 200, height: 90)
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initSet()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func initSet() {
    backgroundColor = UIColor.yellow
    contentView.addSubview(gossipLabel)
  }
  
  func configuew(gossipText: String) {
    gossipLabel.text = gossipText
  }
  
}

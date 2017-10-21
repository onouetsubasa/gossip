//
//  FriendCollectionViewCell.swift
//  Gossip
//
//  Created by 尾之上翼 on 2017/10/21.
//  Copyright © 2017年 Goissip. All rights reserved.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
  
  private let  cardView: UIView = {
    let view = UIView()
    view.frame = CGRect(x: 16, y: 0, width: myWidth - 32, height: 110)
    view.layer.cornerRadius = 10
    view.layer.borderWidth = 1
    return view
  }()
  
  private let userImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.frame = CGRect(x: 16, y: 10, width: 90, height: 90)
    imageView.backgroundColor = UIColor.blue
    return imageView
  }()
  
  private let nameLabel: UILabel = {
    let label = UILabel()
    label.frame = CGRect(x: 100, y: 30, width: myWidth, height: 100)
    label.textAlignment = .left
    
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
    
    cardView.addSubview(nameLabel)
    cardView.addSubview(userImageView)
    
    contentView.addSubview(cardView)
    
    setNameLabelPosition()
    
  }
  
  private func setNameLabelPosition() {
    nameLabel.frame.origin.x = userImageView.frame.maxX + 16
    nameLabel.layer.position.y = frame.height / 2.0
  }
  
  func configure(name: String) {
    nameLabel.text = name
    nameLabel.sizeToFit()
    
    setNameLabelPosition() 
  }

}

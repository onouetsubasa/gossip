//
//  UserCell.swift
//  Gossip
//
//  Created by 尾之上翼 on 2017/09/23.
//  Copyright © 2017年 Goissip. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class UserCell: UICollectionViewCell {
  
  let userImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.frame = CGRect(x: 0, y: 0, width: myWidth*0.43, height: myWidth*0.43)
    imageView.backgroundColor = UIColor.blue
    return imageView
  }()
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.frame = CGRect(x: 0, y: myWidth*0.43, width: myWidth*0.43, height: myWidth*0.17)
    label.text = "かかかかっかあああああ"
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupObjects()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupObjects() {
    addSubview(userImageView)
    addSubview(nameLabel)
  }
  
  func configure(info: Fri) {
    nameLabel.text = info.name
    
    if let urlString = info.image {
      let url = Foundation.URL(string: urlString)!
      userImageView.af_setImage(withURL: url, placeholderImage: UIImage(), imageTransition: .crossDissolve(0.3), runImageTransitionIfCached: true, completion: nil)
    }
    
  }
  
}

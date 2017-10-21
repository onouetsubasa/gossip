//
//  FriendView.swift
//  Gossip
//
//  Created by 尾之上翼 on 2017/10/21.
//  Copyright © 2017年 Goissip. All rights reserved.
//

import UIKit

protocol FriendViewDelegate: class {
  func showFriendDetailVC(info: String)
}

class FriendView: UIView {
  
  weak var delegate: FriendViewDelegate?
  
  var friends: [String]? {
    didSet {
      friendCollectionView.reloadData()
    }
  }
  
  private var friendCollectionView: UICollectionView = {
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumInteritemSpacing = 5
    
    let collection = UICollectionView( frame: CGRect(x: 0, y: 30, width: myWidth, height: myHeight), collectionViewLayout: layout)
    collection.backgroundColor = UIColor.white
    collection.register(FriendCollectionViewCell.self, forCellWithReuseIdentifier: "friendCell")
    collection.showsVerticalScrollIndicator = false
    collection.showsHorizontalScrollIndicator = false
    collection.isPagingEnabled = true
    collection.alwaysBounceHorizontal = false
    collection.alwaysBounceVertical = true
    collection.layer.masksToBounds = false
    collection.isScrollEnabled = true
    collection.setCollectionViewLayout(layout, animated: false)
    
    return collection
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    initSet()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initSet() {
    
    backgroundColor = UIColor.white
    
    friendCollectionView.dataSource = self
    friendCollectionView.delegate = self
    
    addSubview(friendCollectionView)
  }
  
  
}

extension FriendView: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if let _friends = friends {
      return _friends.count
    } else {
      return 1
    }
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendCell", for: indexPath) as! FriendCollectionViewCell
    
    
    if let _friends = friends {
      let name = _friends[indexPath.item]
      cell.configure(name: name)
    }
    
    return cell
  }
  
}

extension FriendView: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let _friends = friends {
      let name = _friends[indexPath.item]
      print(name)
      
      delegate?.showFriendDetailVC(info: name)
      
    }
  }
  
}

extension FriendView: UICollectionViewDelegateFlowLayout {
  
  internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: myWidth, height: 110)
  }
}

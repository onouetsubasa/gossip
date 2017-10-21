//
//  FriendDetailView.swift
//  Gossip
//
//  Created by 尾之上翼 on 2017/10/21.
//  Copyright © 2017年 Goissip. All rights reserved.
//

import UIKit

final class FriendDetailView: UIView {
  
  private let friendMeView: UIView = {
    let view = UIView()
    view.frame = CGRect(x: 16, y: 40, width: myWidth - 32, height: 110)
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
    label.frame = CGRect(x: 100, y: 30, width: myWidth, height: 110)
    label.textAlignment = .left
    return label
  }()
  
  private var gossipCollectionView: UICollectionView = {
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumInteritemSpacing = 5
    
    let collection = UICollectionView( frame: CGRect(x: 0, y: 30, width: myWidth, height: myHeight - 140), collectionViewLayout: layout)
    collection.backgroundColor = UIColor.white
    collection.register(FriendDetailCollectionViewCell.self, forCellWithReuseIdentifier: "detailCell")
    collection.showsVerticalScrollIndicator = false
    collection.showsHorizontalScrollIndicator = false
    collection.isPagingEnabled = true
    collection.alwaysBounceHorizontal = false
    collection.alwaysBounceVertical = true
    collection.layer.masksToBounds = false
    collection.isScrollEnabled = true
    collection.setCollectionViewLayout(layout, animated: false)
    collection.layer.masksToBounds = true
    collection.contentInset.bottom = 20
    
    return collection
  }()
  
  var gossip: [String]? {
    didSet {
      gossipCollectionView.reloadData()
    }
  }
  
  init(info: String) {
    nameLabel.text = info
    nameLabel.sizeToFit()
    nameLabel.frame.origin.x = userImageView.frame.maxX + 16
    
    super.init(frame: CGRect(x: 0, y: 0, width: myWidth, height: myHeight))
    initSet()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func initSet() {
    frame = CGRect(x: 0, y: 0, width: myWidth, height: myHeight)
    backgroundColor = UIColor.white
    
    gossipCollectionView.dataSource = self
    gossipCollectionView.delegate = self
    
    friendMeView.addSubview(userImageView)
    friendMeView.addSubview(nameLabel)
    
    addSubview(friendMeView)
    addSubview(gossipCollectionView)
    
    gossipCollectionView.frame.origin.y = friendMeView.frame.maxY + 10
  }
  
}

extension FriendDetailView: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if let _friends = gossip {
      return _friends.count
    } else {
      return 1
    }
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! FriendDetailCollectionViewCell
    
    
    if let _friends = gossip {
      let gossip = _friends[indexPath.item]
      cell.configuew(gossipText: gossip)
    }
    
    return cell
  }
  
}

extension FriendDetailView: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let _friends = gossip {
      let name = _friends[indexPath.item]
      print(name)
      
    }
  }
  
}

extension FriendDetailView: UICollectionViewDelegateFlowLayout {
  
  internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: myWidth, height: 110)
  }
}

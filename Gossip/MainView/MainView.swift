//
//  MainView.swift
//  Gossip
//
//  Created by 尾之上翼 on 2017/09/23.
//  Copyright © 2017年 Goissip. All rights reserved.
//

import UIKit

let myWidth: CGFloat = UIScreen.main.bounds.size.width
let myHeight: CGFloat = UIScreen.main.bounds.size.height

class MainView: UIView {
  
  var friendInfos: [Fri]? {
    didSet {
      userCollectionView.reloadData()
    }
  }
  
  var friendNames: [String]? {
    didSet {
      userCollectionView.reloadData()
    }
  }
  
  var friendImages: [String]? {
    didSet {
      userCollectionView.reloadData()
    }
  }
  
  let questionLabel: UILabel = {
    let label = UILabel()
    label.frame = CGRect(x: myWidth*0.05, y: 100, width: myWidth*0.9, height: 50)
    label.text = "優しい人は?"
    return label
  }()
  
  internal var userCollectionView: UICollectionView = {
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = myWidth*0.01
    layout.minimumInteritemSpacing = myWidth*0.01
    
    let collection = UICollectionView( frame: CGRect(x: myWidth*0.06, y: 151, width: myWidth*0.88, height: myWidth*1.2 + 50 ), collectionViewLayout: layout)
    collection.backgroundColor = UIColor.white
    collection.register(UserCell.self, forCellWithReuseIdentifier: "UserCell")
    collection.showsVerticalScrollIndicator = false
    collection.showsHorizontalScrollIndicator = false
    collection.isPagingEnabled = false
    collection.alwaysBounceHorizontal = false
    collection.alwaysBounceVertical = false
    collection.layer.masksToBounds = true
    collection.isScrollEnabled = false
    collection.setCollectionViewLayout(layout, animated: false)
    
    return collection
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setObjects()
  }
  
  func setObjects() {
    
    frame = CGRect(x: 0, y: 0, width: myWidth, height: myHeight)
    backgroundColor = UIColor.white
    
    userCollectionView.dataSource = self
    userCollectionView.delegate = self
    
    addSubview(questionLabel)
    addSubview(userCollectionView)
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension MainView: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    if let name = friendNames {
      if name.count >= 4 {
        return 4
      } else {
        return name.count
      }
    } else {
      return 1
    }
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! UserCell
    
    if let _friendInfo = friendInfos {
      cell.configure(info: _friendInfo[indexPath.item])
    }
    return cell
  }
  
}

extension MainView: UICollectionViewDelegate {
  
}

extension MainView: UICollectionViewDelegateFlowLayout {
  
  internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: myWidth*0.43, height: myWidth*0.43 + myWidth*0.17)
  }
  
}

//
//  FriendModel.swift
//  Gossip
//
//  Created by 尾之上翼 on 2017/10/19.
//  Copyright © 2017年 Goissip. All rights reserved.
//

import UIKit
import ObjectMapper

struct Recieve: Mappable {
  var data: Any?
  var paging: Any?
  
  init?(map: Map) {
  }
  
  mutating func mapping(map: Map) {
    data <- map["data"]
    paging <- map["paging"]
  }
}

struct Friend: Mappable {

  var id: String!
  var name: String!
  
  init?(map: Map) {
  }
  
  mutating func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
  }
}

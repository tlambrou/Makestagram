//
//  Post.swift
//  Makestagram
//
//  Created by Tassos Lambrou on 6/11/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import UIKit
import FirebaseDatabase.FIRDataSnapshot

class Post {
  
  // properties and initializers
  var key: String?
  let imageURL: String
  let imageHeight: CGFloat
  let creationDate: Date
  
  var dictValue: [String : Any] {
    let createdAgo = creationDate.timeIntervalSince1970
    
    return ["image_url" : imageURL,
            "image_height" : imageHeight,
            "created_at" : createdAgo]
  }
  
  init(imageURL: String, imageHeight: CGFloat) {
    self.imageURL = imageURL
    self.imageHeight = imageHeight
    self.creationDate = Date()
  }
  
}

//
//  PostService.swift
//  Makestagram
//
//  Created by Tassos Lambrou on 6/11/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

struct PostService {
  
  static func create(for image: UIImage) {
    let imageRef = Storage.storage().reference().child("test_image.jpg")
    StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
      guard let downloadURL = downloadURL else {
        return
      }
      
      let urlString = downloadURL.absoluteString
      print("image url: \(urlString)")
    }
  }
  
}

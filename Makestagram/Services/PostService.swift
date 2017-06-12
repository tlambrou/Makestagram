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
    let imageRef = StorageReference.newPostImageReference()
    StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
      guard let downloadURL = downloadURL else {
        return
      }
      
      let urlString = downloadURL.absoluteString
      let aspectHeight = image.aspectHeight
      create(forURLString: urlString, aspectHeight: aspectHeight)
    }
  }
  
  private static func create(forURLString urlString: String, aspectHeight: CGFloat) {
    // 1
    let currentUser = User.current
    // 2
    let post = Post(imageURL: urlString, imageHeight: aspectHeight)
    // 3
    let dict = post.dictValue
    
    // 4
    let postRef = Database.database().reference().child("posts").child(currentUser.uid).childByAutoId()
    //5
    postRef.updateChildValues(dict)
  }
  
}

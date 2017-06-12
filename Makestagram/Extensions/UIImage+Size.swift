//
//  UIImage+Size.swift
//  Makestagram
//
//  Created by Tassos Lambrou on 6/11/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import UIKit

extension UIImage {
  var aspectHeight: CGFloat {
    let heightRatio = size.height / 736
    let widthRatio = size.width / 414
    let aspectRatio = fmax(heightRatio, widthRatio)
    
    return size.height / aspectRatio
  }
}

//
//  MainTabBarController.swift
//  Makestagram
//
//  Created by Tassos Lambrou on 6/10/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
  
  // MARK: - Properties
  
  let photoHelper = MGPhotoHelper()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    photoHelper.completionHandler = { image in
      print("handle image")
    }
    
    delegate = self
    tabBar.unselectedItemTintColor = .black
  }
  
}

extension MainTabBarController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    if viewController.tabBarItem.tag == 1 {
      photoHelper.presentActionSheet(from: self)
      return false
    }
    
    return true
  }
}

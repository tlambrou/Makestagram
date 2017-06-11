//
//  CreateUsernameViewController.swift
//  Makestagram
//
//  Created by Tassos Lambrou on 6/9/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
  
  @IBOutlet weak var usernameTextField: UITextField!
  
  @IBOutlet weak var nextButton: UIButton!
  
  @IBAction func nextButtonTapped(_ sender: UIButton) {
    guard let firUser = Auth.auth().currentUser,
      let username = usernameTextField.text,
      !username.isEmpty else { return }
    
    UserService.create(firUser, username: username) { (user) in
      guard let user = user else {
        // handle error
        return
      }
      
      User.setCurrent(user)
      
      let initialViewController = UIStoryboard.initialViewController(for: .main)
      self.view.window?.rootViewController = initialViewController
      self.view.window?.makeKeyAndVisible()
    }
    
  }
  
  
}

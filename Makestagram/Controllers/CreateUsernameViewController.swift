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
    // 1
    guard let firUser = Auth.auth().currentUser,
      let username = usernameTextField.text,
      !username.isEmpty else { return }
    
    // 2
    let userAttrs = ["username": username]
    
    // 3
    let ref = Database.database().reference().child("users").child(firUser.uid)
    
    // 4
    ref.setValue(userAttrs) { (error, ref) in
      if let error = error {
        assertionFailure(error.localizedDescription)
        return
      }
      
      // 5
      ref.observeSingleEvent(of: .value, with: { (snapshot) in
        let user = User(snapshot: snapshot)
        
        // handle newly created user here
        print("Created New User") 
      })
    }
  }
  
  
}

//
//  LoginViewController.swift
//  Makestagram
//
//  Created by Tassos Lambrou on 6/8/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
  
  @IBOutlet weak var loginButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Additional setup
    
  }
  
  @IBAction func loginButtonTapped(_ sender: Any) {
    
    // 1
    guard let authUI = FUIAuth.defaultAuthUI()
      else { return }
    
    // 2
    authUI.delegate = self
    
    // 3
    let authViewController = authUI.authViewController()
    present(authViewController, animated: true)
    
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    
  }
  
}

extension LoginViewController: FUIAuthDelegate {
  func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
    if let error = error {
      assertionFailure("Error signing in: \(error.localizedDescription)")
    }
    
    // 1
    guard let user = user
      else { return }
    
    // 2
    let userRef = Database.database().reference().child("users").child(user.uid)
    
    userRef.observeSingleEvent(of: .value, with: { (snapshot) in
      if let user = User(snapshot: snapshot) {
        print("Welcome back, \(user.username).")
      } else {
        self.performSegue(withIdentifier: "toCreateUsername", sender: self)      }
    })
    
  }
}

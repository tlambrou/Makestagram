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
    
    guard let user = user
      else { return }
    
    let userRef = Database.database().reference().child(Constants.Database.Users.users).child(user.uid)
    
    userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
      if let user = User(snapshot: snapshot) {
        User.setCurrent(user)
        
        let initialViewController = UIStoryboard.initialViewController(for: .main)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
      } else {
        self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
      }
    })
    
    UserService.show(forUID: user.uid) { (user) in
      if let user = user {
        // handle existing user
        User.setCurrent(user, writeToUserDefaults: true)
        
        let initialViewController = UIStoryboard.initialViewController(for: .main)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
      } else {
        // handle new user
        self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
      }
    }
    
  }
}

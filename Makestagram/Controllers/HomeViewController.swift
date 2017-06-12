//
//  HomeViewController.swift
//  Makestagram
//
//  Created by Tassos Lambrou on 6/10/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  // MARK: - Properties & Outlets
  
  @IBOutlet weak var tableView: UITableView!
  
  var posts = [Post]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    UserService.posts(for: User.current) { (posts) in
      self.posts = posts
      self.tableView.reloadData()
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PostImageCell", for: indexPath)
    cell.backgroundColor = .red
    
    return cell
  }
}

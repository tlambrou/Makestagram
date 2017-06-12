//
//  PostHeaderCell.swift
//  Makestagram
//
//  Created by Tassos Lambrou on 6/11/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell {
  
  static let height: CGFloat = 54
  
  @IBOutlet weak var usernameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  @IBAction func optionsButtonTapped(_ sender: Any) {
    print("options button tapped")
  }
  
}

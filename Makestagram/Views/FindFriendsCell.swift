//
//  FindFriendsCell.swift
//  Makestagram
//
//  Created by Tassos Lambrou on 6/12/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import UIKit

protocol FindFriendsCellDelegate: class {
  func didTapFollowButton(_ followButton: UIButton, on cell: FindFriendsCell)
}

class FindFriendsCell: UITableViewCell {
  
  // MARK: - Properties
  
  weak var delegate: FindFriendsCellDelegate?
  
  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var followButton: UIButton!
  
  // MARK: - Cell Lifecycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    followButton.layer.borderColor = UIColor.lightGray.cgColor
    followButton.layer.borderWidth = 1
    followButton.layer.cornerRadius = 6
    followButton.clipsToBounds = true
    
    followButton.setTitle("Follow", for: .normal)
    followButton.setTitle("Following", for: .selected)
  }
  
  // MARK: - IBActions
  
  @IBAction func followButtonTapped(_ sender: Any) {
    delegate?.didTapFollowButton(sender as! UIButton, on: self)
  }
  
}

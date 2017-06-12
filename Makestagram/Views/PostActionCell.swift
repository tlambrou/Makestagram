//
//  PostActionCell.swift
//  Makestagram
//
//  Created by Tassos Lambrou on 6/11/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import UIKit

class PostActionCell: UITableViewCell {
  
  @IBOutlet weak var likeButton: UIButton!
  @IBOutlet weak var likeCountLabel: UILabel!
  @IBOutlet weak var timeAgoLabel: UILabel!
  
  static let height: CGFloat = 46
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  @IBAction func likeButtonTapped(_ sender: Any) {
    print("like button tapped")
    
  }
  
}

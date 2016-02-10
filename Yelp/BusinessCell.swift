//
//  BusinessCell.swift
//  Yelp
//
//  Created by Aurielle on 2/9/16.
//  Copyright © 2016 Aurielle. All rights reserved.
//

import UIKit
import AFNetworking

class BusinessCell: UITableViewCell {
  
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var distanceLabel: UILabel!
  @IBOutlet weak var moneyLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var foodTypeLabel: UILabel!
  @IBOutlet weak var reviewsCountLabel: UILabel!
  @IBOutlet weak var ratingImageView: UIImageView!
  
  var business : Business!{
    didSet{
      nameLabel.text = business.name;
      posterImageView.setImageWithURL(business.imageURL!)
      foodTypeLabel.text = business.categories
      addressLabel.text = business.address
      reviewsCountLabel.text = "\(business.reviewCount!) Reviews"
      ratingImageView.setImageWithURL(business.ratingImageURL!)
      distanceLabel.text = business.distance
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    self.posterImageView.layer.cornerRadius = 3
    self.posterImageView.clipsToBounds = true
    
    nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

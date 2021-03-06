//
//  DDVenueTableViewCell.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/27/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit
import Kingfisher

class DDVenueTableViewCell: UITableViewCell {

    // Venue Object
    var venue: DDVenue? {
        didSet {
            
            self.clearUI()
            
            // Set UI for venue object
            // Safety check
            guard let venue = venue else { return }
            
            // Name label
            if let name = venue.name {
                
                self.nameLabel.text = name
            }
            
            // Category label
            if let description = venue.venueDescription {
                
                self.categoryLabel.text = description
            }
            
            // Async image load
            if let imageURL = venue.imageURL {
                
                self.venueImageView.kf.setImage(with: imageURL)
            }
            
            // Delivery fee
            if venue.deliveryFee > 0.0 {
                
                self.priceLabel.text = String(format: "$%.2f delivery", venue.deliveryFee)
            }
            
            if venue.asapTimeMin > 0 {
                
                self.timeLabel.text = "\(venue.asapTimeMin) min"
            }
        }
    }
    
    // Image View
    @IBOutlet weak var venueImageView: UIImageView!
    
    // Name Label
    @IBOutlet weak var nameLabel: UILabel!
    
    // Type Label
    @IBOutlet weak var categoryLabel: UILabel!
    
    // Delivery Price Label
    @IBOutlet weak var priceLabel: UILabel!
    
    // Delivery time Label
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        venueImageView.layer.cornerRadius = 4.0
        venueImageView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.clearUI()
    }
    
    func clearUI() {
        
        self.priceLabel.text = ""
        self.timeLabel.text = ""
        self.categoryLabel.text = ""
        self.nameLabel.text = ""
        self.venueImageView.image = nil
    }
}

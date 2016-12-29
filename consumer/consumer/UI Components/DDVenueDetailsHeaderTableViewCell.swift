//
//  DDVenueDetailsHeaderTableViewCell.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/28/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit

class DDVenueDetailsHeaderTableViewCell: UITableViewCell {

    // Venue Object
    var venue: DDVenue? {
        didSet {
            
            // Safety check
            guard let venue = venue else { return }
            
            // Async image load
            if let imageURL = venue.imageURL {
                
                self.venueImageView.kf.setImage(with: imageURL)
            }
            
            if venue.asapTimeMin > 0 {
                
                self.timeLabel.text = "\(venue.asapTimeMin) min"
            }
        }
    }

    // Venue Image view
    @IBOutlet weak var venueImageView: UIImageView!
    
    // Delivery Time Label
    @IBOutlet weak var timeLabel: UILabel!
    
    // Fav Button
    @IBOutlet weak var favoriteButton: UIButton!
    
    // MARK: - Action
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        
    }
}

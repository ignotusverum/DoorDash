//
//  DDVenueDetailsHeaderTableViewCell.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/28/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit
import MagicalRecord

class DDVenueDetailsHeaderTableViewCell: UITableViewCell {

    // Venue Object
    var venue: DDVenue? {
        didSet {
            
            // Safety check
            guard let venue = venue else { return }
            
            // Setup favorite button
            updateFavoriteButton(venue.favorite)
            
            // Async image load
            if let imageURL = venue.imageURL {
                
                self.venueImageView.kf.setImage(with: imageURL)
            }
            
            if venue.asapTimeMin > 0 {
                
                self.timeLabel.text = "Free delivery in \(venue.asapTimeMin) min"
            }
        }
    }

    // Venue Image view
    @IBOutlet weak var venueImageView: UIImageView!
    
    // Delivery Time Label
    @IBOutlet weak var timeLabel: UILabel!
    
    // Fav Button
    @IBOutlet weak var favoriteButton: UIButton!
    
    // Favorite button closure
    var favoriteClosure: ((_ result: Bool) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        venueImageView.layer.cornerRadius = 8.0
        venueImageView.clipsToBounds = true
        
        favoriteButton.layer.borderColor = UIColor.defaultColor.cgColor
        favoriteButton.layer.borderWidth = 1.0
        
        favoriteButton.layer.cornerRadius = 4.0
        favoriteButton.clipsToBounds = true
    }
    
    // Favorite
    func favoritePressed(completion: ((_ result: Bool) -> ())?) {
        
        self.favoriteClosure = completion
    }
    
    func updateFavoriteButton(_ favorite: Bool) {
        
        if favorite {
        
            self.favoriteButton.setTitle("Favorited", for: .normal)
            self.favoriteButton.setTitleColor(UIColor.white, for: .normal)
            self.favoriteButton.setBackgroundColor(UIColor.defaultColor, forState: .normal)
            
            return
        }
        
        self.favoriteButton.setTitle("Add to Favorites", for: .normal)
        self.favoriteButton.setTitleColor(UIColor.defaultColor, for: .normal)
        self.favoriteButton.setBackgroundColor(UIColor.clear, forState: .normal)
    }
    
    // MARK: - Action
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        
        // Safety check
        guard let venue = venue else { return }
        
        venue.favorite = !venue.favorite
        
        updateFavoriteButton(venue.favorite)
        
        do {
            try NSManagedObjectContext.mr_rootSaving().save()
        } catch { }
        
        // Pass closure
        self.favoriteClosure?(venue.favorite)
    }
}

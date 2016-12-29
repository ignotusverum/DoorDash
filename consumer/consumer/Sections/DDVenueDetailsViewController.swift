//
//  DDVenueDetailsViewController.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/28/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit

class DDVenueDetailsViewController: UIViewController {

    // Venue
    var venue: DDVenue?

    // Table View
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Safety check
        guard let venue = venue else {
            self.popVC()
            return
        }
        
        // Setup UI based on venue info
        self.setupUI(venue)
    }
    
    // MARK: - UI Setup
    func setupUI(_ venue: DDVenue) {
        
        // Safety check
        guard let menu = venue.category else { return }
        
        print(menu)
    }
}

// MARK: - Table view datasource
extension DDVenueDetailsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

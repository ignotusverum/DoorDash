//
//  DDVenueListViewController.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/27/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit

class DDVenueListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Datasource
    var datasource = [DDVenue]()
    
    // MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set title
        self.setTitle("DoorDash")
        
        // Retreive current location
        
    }
    
    // MARK: - Actions
    @IBAction func mapActionpPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
    }
}

// MARK: - Table view delegate
extension DDVenueListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}

// MARK: - Table view datasource
extension DDVenueListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "VenueCell")

        if cell == nil {
            
            let venue = self.datasource[indexPath.row]
            
            cell = DDVenueTableViewCell(venue: venue, reuseIdentifier: "VenueCell")
        }
        
        return cell!
    }
}

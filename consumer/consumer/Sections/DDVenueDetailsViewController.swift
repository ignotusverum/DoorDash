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
    
    // Menu datasource
    var menusDatasource = [DDCategoryMenu]()
    
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
        
        // Disable empty dividers
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    // MARK: - Cells setup
    func cellsSetup() {
        
        let headerCellNib = UINib(nibName: "DDVenueDetailsHeaderTableViewCell", bundle: nil)
        tableView.register(headerCellNib, forCellReuseIdentifier: "DDVenueDetailsHeaderTableViewCell")
    }
    
    // MARK: - UI Setup
    func setupUI(_ venue: DDVenue) {
        
        // Safety check
        guard let menu = venue.category else { return }
        
        // Menus objects
        self.menusDatasource = menu.menus.allObjects as! [DDCategoryMenu]
        
        print(self.menusDatasource)
    }
}

// MARK: - Table view datasource
extension DDVenueDetailsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menusDatasource.count > 0 ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 1 ? menusDatasource.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Header cell. setup
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DDVenueDetailsHeaderTableViewCell", for: indexPath) as! DDVenueDetailsHeaderTableViewCell
            cell.venue = venue
            
            return cell
        }
        
        
        return UITableViewCell()
    }
}

extension DDVenueDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return indexPath.section == 0 ? 230 : 45
    }
}

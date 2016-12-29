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
    var venue: DDVenue? {
        didSet {
            
            self.tableView?.reloadData()
            
            // Safety check
            guard let category = venue?.category else { return }
            
            // Menus objects
            self.menusDatasource = category.menus.allObjects as! [DDCategoryMenu]
        }
    }
    
    // Menu datasource
    var menusDatasource = [DDCategoryMenu]()
    
    // Table View
    @IBOutlet weak var tableView: UITableView?
    
    // MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cells setup
        self.cellsSetup()
        
        // Safety check
        guard let venue = venue else {
            self.popVC()
            return
        }
        
        // Disable empty dividers
        self.tableView?.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    // MARK: - Cells setup
    func cellsSetup() {
        
        let headerCellNib = UINib(nibName: "DDVenueDetailsHeaderTableViewCell", bundle: nil)
        let menuCellNib = UINib(nibName: "DDMenuTableViewCell", bundle: nil)
        
        tableView?.register(headerCellNib, forCellReuseIdentifier: "DDVenueDetailsHeaderTableViewCell")
        tableView?.register(menuCellNib, forCellReuseIdentifier: "DDMenuTableViewCell")
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
        
        // Menu cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "DDMenuTableViewCell", for: indexPath) as! DDMenuTableViewCell
        
        let menu = self.menusDatasource[indexPath.row]
        cell.menu = menu
        
        return cell
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

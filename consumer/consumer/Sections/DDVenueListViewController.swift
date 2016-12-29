//
//  DDVenueListViewController.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/27/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit
import SwiftLocation
import SVProgressHUD

class DDVenueListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Datasource
    var datasource = [DDVenue]()
    var resultDatasource = [DDVenue]()
    
    // Search bar
    lazy var searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, w: 0.0, h: 20))
    var searchActive = false
    
    // MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set title
        self.setTitle("DoorDash")
        
        // Load cell nib
        self.cellSetup()
        
        // Retreive current location
        let _ = Location.getLocation(withAccuracy: .block, onSuccess: { location in
         
            // Fetch data based on location
            DDVenueAdapter.fetch(lat: location.coordinate.latitude, lng: location.coordinate.longitude).then { result-> Void in
                
                // Update datasource + sort
                self.datasource = result.sorted {
                    
                    guard let name0 = $0.name, let name1 = $1.name else { return false }
                    return name0 < name1
                }
                
                self.resultDatasource = self.datasource
                
                self.tableView.reloadData()
                
                }.catch { error-> Void in
                    
                    // Something went wrong - show error
                    self.showOneButtonAlertController(title: "Whoops", message: error.localizedDescription, cancelButtonText: "Ok")
            }
            
        }) { (location, error) in
            
            // Location retreiveing went wrong - show error
            self.showOneButtonAlertController(title: "Whoops", message: error.localizedDescription, cancelButtonText: "Ok")
        }
        
        // Disable empty dividers
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    // MARK: - Search bar
    func searchBar(show: Bool) {
        
        self.searchActive = show
        
        if show {
            searchBar = UISearchBar(frame: CGRect(x: 40.0, y: 0.0, w: self.view.frame.width - 40.0, h: 20.0))
            searchBar.delegate = self
            
            searchBar.placeholder = "Search"
            
            self.navigationItem.titleView = searchBar
            
            searchBar.becomeFirstResponder()
            
            // Add cancel search button
            
            return
        }
        
        // Return title
        self.setTitle("Door Dash")
    }
    
    // MARK: - Cell Loading
    func cellSetup() {
        
        let cellNib = UINib(nibName: "DDVenueTableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "DDVenueTableViewCell")
    }
    
    // MARK: - Actions
    @IBAction func mapActionpPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        self.searchBar(show: !searchActive)
    }
}

// MARK: - Table view delegate
extension DDVenueListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let venue = self.datasource[indexPath.row]
        
        // Show progress
        SVProgressHUD.show()
        
        // Setup venue details controller
        let sb = self.storyboard
        let venueDetailsVC = sb?.instantiateViewController(withIdentifier: "DDVenueDetailsViewController") as! DDVenueDetailsViewController
        venueDetailsVC.venue = venue
        
        self.pushVC(venueDetailsVC)
        
        // Fetch venue details
        DDVenueAdapter.details(venue: venue).then { response-> Void in
            
            // Hide
            SVProgressHUD.dismiss()
            
            if let _ = response {
                
                venueDetailsVC.venue = venue
            }
            else {
                
                // Show error - parsing failure
                self.showOneButtonAlertController(title: "Whoops", message: "Something went wrong, please try again", cancelButtonText: "Ok")
            }
            }.catch { error-> Void in
                
                // Networking call failure
                self.showOneButtonAlertController(title: "Whoops", message: error.localizedDescription, cancelButtonText: "Ok")
        }
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DDVenueTableViewCell", for: indexPath) as? DDVenueTableViewCell

        let venue = self.datasource[indexPath.row]
        
        cell!.venue = venue
        
        return cell!
    }
}

// MARK: - Seach bar delegate
extension DDVenueListViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {}
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) { }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        self.searchBar.text = ""
        searchBar.resignFirstResponder()
        
        self.datasource = self.resultDatasource
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.performSearchWith(text: searchBar.text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.length == 0 {
            
            self.datasource = self.resultDatasource
            self.tableView.reloadData()
        }
        else {
            
            self.performSearchWith(text: searchText)
        }
    }
    
    func performSearchWith(text: String?) {

        self.datasource = self.resultDatasource.filter {
            
            guard let name = $0.name, let text = text else { return false }
            return name.contains(text)
        }
        
        self.tableView.reloadData()
    }
}

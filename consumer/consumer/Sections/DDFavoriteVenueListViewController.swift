//
//  DDFavoriteVenueListViewController.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/27/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit
import CoreData

class DDFavoriteVenueListViewController: DDVenueListViewController {

    // MARK: - Contoller lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Setup fethed result controller
        self.createFetchController()
    }
    
    // MARK: - Fetch controller
    func createFetchController() {
        
        // Warning - this only works localy
        // There's no provided enpoint patching venue with 
        // Changed favorites value
        let favoritesPreticate = NSPredicate(format: "\(DDVenueAttributes.favorite.rawValue) = YES")
        
        let fetchResult = DDVenue.mr_requestAll(with: favoritesPreticate, in: NSManagedObjectContext.mr_rootSaving())
        fetchResult.sortDescriptors = [NSSortDescriptor(key: DDVenueAttributes.name.rawValue, ascending: true)]
        
        self.datasource = DDVenue.mr_executeFetchRequest(fetchResult, in: NSManagedObjectContext.mr_rootSaving()) as! [DDVenue]
        
        self.tableView.reloadData()
    }
}

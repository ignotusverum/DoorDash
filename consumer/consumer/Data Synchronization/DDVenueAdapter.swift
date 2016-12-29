//
//  DDVenueAdapter.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/27/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit

import SwiftyJSON
import PromiseKit
import MagicalRecord

class DDVenueAdapter: NSObject {

    // Fetch venue details
    // * Venue ID
    class func details(venue: DDVenue)-> Promise<DDVenue?> {
        
        // Netman
        let netman = DDNetworkingManager.shared
        return netman.request(.get, path: "restaurant/\(venue.modelID)/menu", version: "v2").then { response-> DDVenue? in
            
            do {
                
                // Getting category arraay
                if let categoriesArray = response.array {
                    
                    // Enumerating category array
                    for categoryJSON in categoriesArray {
                        
                        // Insering category object
                        let category = try DDVenueCategory.fetchOrInsert(json: categoryJSON)
                        // Update venue object
                        venue.category = category
                        
                        // Getting menu array from category json
                        if let menuArray = categoryJSON["menu_categories"].array {
                            
                            // Enumerate menu array
                            for menuJSON in menuArray {
                             
                                // Insering menu object
                                let menu = try DDCategoryMenu.fetchOrInsert(json: menuJSON)
                                // Updating category object
                                if let menu = menu {
                                 
                                    category?.addMenusObject(menu)
                                    
                                    // Getting items array from menu json
                                    if let itemsArray = menuJSON["items"].array {
                                        
                                        // Parse items
                                        for itemJSON in itemsArray {
                                            
                                            // Inserting item menu object
                                            let item = try DDVenueItem.fetchOrInsert(json: itemJSON)
                                            // Updating menu object
                                            if let item = item {
                                                
                                                menu.addItemsObject(item)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
                // Save changes
                try NSManagedObjectContext.mr_rootSaving().save()
                
                // Return result
                return venue
            }
            catch {
                return nil
            }
        }
    }
    
    // Fetch venues with location
    // lat / lng
    class func fetch(lat: Double, lng: Double)-> Promise<[DDVenue]> {
        
        // Does not accept params - returns 400
        let netman = DDNetworkingManager.shared
        return netman.request(.get, path: "store_search/?lat=\(lat)&lng=\(lng)").then { response-> [DDVenue] in
            
            // Result array
            var resultArray = [DDVenue]()
            
            do {
                
                // Parse array
                if let responseArray = response.array {
                    for json in responseArray {
                        // venue object
                        let venue = try DDVenue.fetchOrInsert(json: json)
                        if let venue = venue {
                            
                            // Add to result array
                            resultArray.append(venue)
                        }
                    }
                }
            }
            catch { }
            
            return resultArray
        }
    }
}

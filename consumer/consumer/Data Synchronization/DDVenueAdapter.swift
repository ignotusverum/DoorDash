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
    class func details(venue: DDVenue)-> Promise<DDVenueMenu?> {
        
        // Netman
        let netman = DDNetworkingManager.shared
        return netman.request(.get, path: "restaurant/\(venue.modelID)/menu", version: "v2").then { response-> DDVenueMenu? in
            
            do {
                
                // Getting category arraay
                if let categoriesArray = response.array {
                    
                    // Enumerating
                    for categoryJSON in categoriesArray {
                     
                        
                    }
                }
                
                // Fetch object
//                let menu = try DDVenueMenu.fetchOrInsert(json: response)
//                menu?.venue = venue
//                venue.menu = menu
                
                // Save changes
                try NSManagedObjectContext.mr_rootSaving().save()
                
                // Return result
                return nil
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

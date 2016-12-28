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

class DDVenueAdapter: NSObject {

    // Fetch venue details
    // * Venue ID
    class func details(venueID: Int)-> Promise<JSON> {
        
        // Netman
        let netman = DDNetworkingManager.shared
        return netman.request(.get, path: "restaurant/\(venueID)", version: "v2")
    }
    
    // Fetch venues with location
    // lat / lng
    class func fetch(lat: Double, lng: Double) {
        
        // Does not accept params - returns 400
        let netman = DDNetworkingManager.shared
        netman.request(.get, path: "store_search/?lat=\(lat)&lng=\(lng)").then { result-> Void in
            
            print(result)
        }
    }
}

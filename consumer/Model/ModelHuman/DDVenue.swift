//
//  DDVenue.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/02/16.
//  Copyright © 2016 Vladislav Zagorodnyuk Co. All rights reserved.
//

import CoreData
import SwiftyJSON

import PromiseKit

@objc(DDVenue)
open class DDVenue: _DDVenue {

    // Asap Time
    var asapTime: Double {

        // Asap time to hours
        return Double(asapTimeMin) / 60.0
    }
    
    // Delivery Fee
    var deliveryFee: Double {
        
        return Double(deliveryFeeCent) / 100.0
    }
    
	// MARK: - Fetching logic
    class func fetchObject(objectID: Int, context: NSManagedObjectContext = NSManagedObjectContext.mr_rootSaving()) throws -> DDVenue? {
        
        return try DDVenue.modelFetch(objectID: objectID, context:context) as? DDVenue
    }
    
    class func fetchOrInsert(json: JSON, context: NSManagedObjectContext = NSManagedObjectContext.mr_rootSaving()) throws -> DDVenue? {
        
        return try DDVenue.modelFetchOrInsert(json:
            json, context: context) as? DDVenue
    }
    
    override func setValue(json: JSON, context: NSManagedObjectContext) {
        
        super.setValue(json: json)
        
        // Venue Name
        if let name = json["name"].string {
            
            self.name = name
        }
        
        // Category
        if let category = json["featured_category_description"].string {
            
            self.category = category
        }
        
        // Delivery Fee - cent
        if let deliveryFeeCent = json["delivery_fee"].int {
            
            self.deliveryFeeCent = deliveryFeeCent
        }
        
        // Asap time - min
        if let asapTimeMin = json["asap_time"].int {
            
            self.asapTimeMin = asapTimeMin
        }
        
        // Url stirng
        if let urlString = json["cover_img_url"].string {
            
            self.urlString = urlString
        }
        
        // Description
        if let venueDescription = json["description"].string {
            
            self.venueDescription = venueDescription
        }
    }
}

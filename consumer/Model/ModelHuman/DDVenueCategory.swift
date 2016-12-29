//
//  DDVenueCategory.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/02/16.
//  Copyright © 2016 Vladislav Zagorodnyuk Co. All rights reserved.
//

import CoreData
import SwiftyJSON

import PromiseKit

@objc(DDVenueCategory)
open class DDVenueCategory: _DDVenueCategory {

	// MARK: - Fetching logic
    class func fetchObject(objectID: Int, context: NSManagedObjectContext = NSManagedObjectContext.mr_rootSaving()) throws -> DDVenueCategory? {
        
        return try DDVenueCategory.modelFetch(objectID: objectID, context:context) as? DDVenueCategory
    }
    
    class func fetchOrInsert(json: JSON, context: NSManagedObjectContext = NSManagedObjectContext.mr_rootSaving()) throws -> DDVenueCategory? {
        
        return try DDVenueCategory.modelFetchOrInsert(json:
            json, context: context) as? DDVenueCategory
    }
    
    override func setValue(json: JSON, context: NSManagedObjectContext) {
        
        super.setValue(json: json)
        
        if let name = json["name"].string {
            
            self.name = name
        }
        
        if let isCathering = json["is_catering"].bool {
            
            self.isCathering = isCathering
        }
        
        if let headerImageString = json["header_image_url"].string {
            
            self.headerImageString = headerImageString
        }
        
        if let statusString = json["status_type"].string {
            
            self.statusString = statusString
        }
        
        if let openHoursArray = json["open_hours"].array {
            
            // Set open hours array
        }
    }
}

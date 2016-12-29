//
//  DDVenueItem.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/02/16.
//  Copyright © 2016 Vladislav Zagorodnyuk Co. All rights reserved.
//

import CoreData
import SwiftyJSON

import PromiseKit

@objc(DDVenueItem)
open class DDVenueItem: _DDVenueItem {

    // MARK: - Fetching logic
    class func fetchObject(objectID: Int, context: NSManagedObjectContext = NSManagedObjectContext.mr_rootSaving()) throws -> DDVenueItem? {
        
        return try DDVenueItem.modelFetch(objectID: objectID, context:context) as? DDVenueItem
    }
    
    class func fetchOrInsert(json: JSON, context: NSManagedObjectContext = NSManagedObjectContext.mr_rootSaving()) throws -> DDVenueItem? {
        
        return try DDVenueItem.modelFetchOrInsert(json:
            json, context: context) as? DDVenueItem
    }
    
    override func setValue(json: JSON, context: NSManagedObjectContext) {
        
        super.setValue(json: json)
    }
}

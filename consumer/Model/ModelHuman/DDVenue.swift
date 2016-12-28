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

	// MARK: - Fetching logic
    class func fetchObject(objectID: String, context: NSManagedObjectContext = NSManagedObjectContext.mr_rootSaving()) throws -> DDVenue? {
        
        return try DDVenue.modelFetch(objectID: objectID, context:context) as? DDVenue
    }
    
    class func fetchOrInsert(json: JSON, context: NSManagedObjectContext = NSManagedObjectContext.mr_rootSaving()) throws -> DDVenue? {
        
        return try DDVenue.modelFetchOrInsert(json:
            json, context: context) as? DDVenue
    }
    
    
    override func setValue(json: JSON, context: NSManagedObjectContext) {
        
        super.setValue(json: json)
        
        if self.modelID != nil {
            
            
            
        }
    }
}

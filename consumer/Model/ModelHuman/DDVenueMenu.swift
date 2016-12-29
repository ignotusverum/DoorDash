//
//  DDVenueMenu.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/02/16.
//  Copyright © 2016 Vladislav Zagorodnyuk Co. All rights reserved.
//

import CoreData
import SwiftyJSON

import PromiseKit

@objc(DDVenueMenu)
open class DDVenueMenu: _DDVenueMenu {

    // MARK: - Fetching logic
    class func fetchObject(objectID: Int, context: NSManagedObjectContext = NSManagedObjectContext.mr_rootSaving()) throws -> DDVenueMenu? {
        
        return try DDVenueMenu.modelFetch(objectID: objectID, context:context) as? DDVenueMenu
    }
    
    class func fetchOrInsert(json: JSON, context: NSManagedObjectContext = NSManagedObjectContext.mr_rootSaving()) throws -> DDVenueMenu? {
        
        return try DDVenueMenu.modelFetchOrInsert(json:
            json, context: context) as? DDVenueMenu
    }
    
    override func setValue(json: JSON, context: NSManagedObjectContext) {
        
        super.setValue(json: json)
        
        
    }
}

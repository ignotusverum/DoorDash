//
//  DDCategoryMenu.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/02/16.
//  Copyright © 2016 Vladislav Zagorodnyuk Co. All rights reserved.
//

import CoreData
import SwiftyJSON

import PromiseKit

@objc(DDCategoryMenu)
open class DDCategoryMenu: _DDCategoryMenu {

    // MARK: - Fetching logic
    class func fetchObject(objectID: Int, context: NSManagedObjectContext = NSManagedObjectContext.mr_rootSaving()) throws -> DDCategoryMenu? {
        
        return try DDCategoryMenu.modelFetch(objectID: objectID, context:context) as? DDCategoryMenu
    }
    
    class func fetchOrInsert(json: JSON, context: NSManagedObjectContext = NSManagedObjectContext.mr_rootSaving()) throws -> DDCategoryMenu? {
        
        return try DDCategoryMenu.modelFetchOrInsert(json:
            json, context: context) as? DDCategoryMenu
    }
    
    override func setValue(json: JSON, context: NSManagedObjectContext) {
        
        super.setValue(json: json)
        
        if let subtitle = json["subtitle"].string {
            
            self.subtitle = subtitle
        }
        
        if let sortID = json["sort_id"].int {
            
            self.sortID = sortID
        }
        
        if let title = json["title"].string {
            
            self.title = title
        }
    }
}

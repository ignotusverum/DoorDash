//
//  DDModel.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/02/16.
//  Copyright © 2016 Vladislav Zagorodnyuk Co. All rights reserved.
//

import CoreData
import SwiftyJSON

import PromiseKit
import MagicalRecord

@objc(DDModel)
open class DDModel: _DDModel {

    var json: JSON?
    
    class func modelFetch(objectID: Int, context: NSManagedObjectContext = NSManagedObjectContext.mr_default()) throws -> Any? {
        
        var result: Any?
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName())
        let predicate = NSPredicate(format:"%K == \(objectID)", DDModelAttributes.modelID.rawValue)
        
        fetchRequest.predicate = predicate
        
        let results = try context.fetch(fetchRequest)
        result = results.first
        
        return result
    }
    
    class func modelFetchOrInsert(json: JSON, context: NSManagedObjectContext = NSManagedObjectContext.mr_default()) throws -> Any? {
        
        var result: Any?
        
        if let modelObjectID = json["id"].int {
            
            result = try self.modelFetch(objectID: modelObjectID, context: context)
            
            if result == nil {
                
                result = self.mr_createEntity(in: context)
            }
            
            let result = result as? DDModel
            result?.setValue(json: json, context: context)
        }
        
        return result
    }
    
    func setValue(json: JSON, context: NSManagedObjectContext = NSManagedObjectContext.mr_default()) {
        
        if self.json != json {
            self.json = json
        }
        
        if let modelID = json["id"].int {
            
            self.modelID = modelID
        }
    }
}

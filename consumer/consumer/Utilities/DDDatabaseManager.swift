//
//  DDDatabaseManager.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/27/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit
import MagicalRecord

class DDDatabaseManager: NSObject {

    // Shared manager
    static let shared = DDDatabaseManager()
    
    func setupDB() {
        
        MagicalRecord.setupCoreDataStack(withAutoMigratingSqliteStoreNamed: self.dbStore())
    }
    
    func dbStore() -> String {
        return "\(self.bundleID()).sqlite"
    }
    
    func bundleID() -> String {
        return Bundle.main.bundleIdentifier!
    }
}

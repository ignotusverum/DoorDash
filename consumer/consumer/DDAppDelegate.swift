//
//  DDAppDelegate.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/27/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class DDAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Test
        DDVenueAdapter.fetch(lat: 37.42274, lng: -122.139956)
        
        // Setup DB
        self.setupDB()
        
        for family in UIFont.familyNames {
            print("\(family)")
            
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   \(name)")
            }
        }
        
        return true
    }
    
    func setupDB() {
        
        let databaseManager = DDDatabaseManager.shared
        databaseManager.setupDB()
    }
}

//
//  DDAppDelegate.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/27/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit
import CoreData

import SVProgressHUD

@UIApplicationMain
class DDAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Mask type
        SVProgressHUD.setDefaultMaskType(.Black)
        
        // Setup DB
        self.setupDB()
        
        // Setup Tab bar tint
        UITabBar.appearance().tintColor = UIColor.defaultColor
        
        return true
    }
    
    func setupDB() {
        
        let databaseManager = DDDatabaseManager.shared
        databaseManager.setupDB()
    }
}

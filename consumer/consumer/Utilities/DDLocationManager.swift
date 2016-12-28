//
//  DDLocationManager.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/28/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

class DDLocationManager: NSObject {

    static let shared = DDLocationManager()
    
    let manager: CLLocationManager
    var locationManagerClosures: [((_ userLocation: CLLocation) -> ())] = []
    
    override init() {
        self.manager = CLLocationManager()
        super.init()
        self.manager.delegate = self
    }
    
    //This is the main method for getting the users location and will pass back the usersLocation when it is available
    func getlocationForUser(userLocationClosure: @escaping ((_ userLocation: CLLocation) -> ())) {
        
        self.locationManagerClosures.append(userLocationClosure)
        
        if CLLocationManager.locationServicesEnabled() {
            if CLLocationManager.authorizationStatus() == .notDetermined {
                
                // Ask for location access
                manager.requestWhenInUseAuthorization()
            } else if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied {
                
                // Show alert - Denied
                
            } else if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
                
                // Get location
                manager.startUpdatingLocation()
            }
        }
    }
}

extension DDLocationManager: CLLocationManagerDelegate {
    
    @objc private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        let tempClosures = self.locationManagerClosures
        for closure in tempClosures {
            closure(newLocation)
        }
        self.locationManagerClosures = []
    }
}

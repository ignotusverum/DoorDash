//
//  DDMapSelectionViewController.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/28/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit
import MapKit

class DDMapSelectionViewController: UIViewController {

    // Map view
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var centerPin = MKPointAnnotation()
    
    // label
    @IBOutlet weak var addressLabel: UILabel!
    
    // MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Title
        self.setTitle("Choose an Address", color: UIColor.black)
        
        // Setup map view
        self.setupMapView()
    }
    
    func setupMapView() {
        
        mapView.showsUserLocation = true
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()

        definesPresentationContext = true
        
        centerPin.coordinate = mapView.centerCoordinate
        mapView.addAnnotation(centerPin)
    }
}

extension DDMapSelectionViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error)")
    }
}

extension DDMapSelectionViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        centerPin.coordinate = mapView.centerCoordinate
        mapView.addAnnotation(centerPin)
        
        // Parse address
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
            
            // Place details
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            
            // Address dictionary
            print(placeMark.addressDictionary)
            
            // Street address
            if let street = placeMark.addressDictionary!["Thoroughfare"] as? String {
                self.addressLabel.text = street
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        
        guard !(annotation is MKUserLocation) else { return nil }
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        }
        
        pinView?.pinTintColor = UIColor.defaultColor
        pinView?.canShowCallout = true
        
        return pinView
    }
}

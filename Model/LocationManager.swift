//
//  LocationManager.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 28/04/2021.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate
{
    var locationManager = CLLocationManager()
    var latitude = CLLocationDegrees()
    var longitude = CLLocationDegrees()
    
    var locationCallback: ((CLLocationDegrees, CLLocationDegrees) -> Void)?
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        if let location = locations.first
        {
            latitude = location.coordinate.latitude
            longitude = location.coordinate.longitude
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
    }
    
    func RequestLocation(locationCallback: @escaping (CLLocationDegrees, CLLocationDegrees) -> Void)
    {
        self.locationCallback = locationCallback
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

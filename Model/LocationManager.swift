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
    var geoCoder = CLGeocoder()
    var locationManager = CLLocationManager()
    var locationCallback: ((String) -> Void)?
    var latLongCallback: ((String) -> Void)?

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        if let location = locations.first
        {
            if (locationCallback != nil)
            {
                var place: String = ""
                geoCoder.reverseGeocodeLocation(
                    location,
                    completionHandler: {(placeMarks, error) in
                        let pm = placeMarks! as [CLPlacemark]
                        if (pm.count > 0)
                        {
                            let pm = placeMarks![0]
                            if (pm.name != nil)
                            {
                                place = pm.name!
                            }
                            if (pm.subLocality != nil)
                            {
                                place += ", " + pm.subLocality!
                            }
                            if (pm.locality != nil)
                            {
                                place += ", " + pm.locality!
                            }
                            if (pm.country != nil)
                            {
                                place += ", " + pm.country!
                            }
                            if (pm.postalCode != nil)
                            {
                                place += ", " + pm.postalCode!
                            }
                            self.locationCallback.unsafelyUnwrapped(place)
                        }
                    })
                let coords =
                    String(format: "%.5f", location.coordinate.latitude) + ", " +
                    String(format: "%.5f", location.coordinate.longitude) + " +/- " +
                    String(format: "%.0f", location.horizontalAccuracy) + " m"
                latLongCallback.unsafelyUnwrapped(coords)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
    }
    
    func RequestLocation(
        latLongCallback: @escaping (String) -> Void,
        locationCallback: @escaping (String) -> Void)
    {
        self.latLongCallback = latLongCallback
        self.locationCallback = locationCallback
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestLocation()
    }
}

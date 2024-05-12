//
//  CurrentLocationManager.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import Foundation
import CoreLocation

class CurrentLocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    var locationManager: CLLocationManager!
    @Published var currentCity: String
    @Published var currentLocation = ""
    @Published var hasLocationLoaded = false
    
    var error: Error?
    
    override init() {
        self.currentCity = "Unknown"
    }
    
    func onViewDidLoad() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        let authorizationStatus = locationManager.authorizationStatus
        handleAuthorizationStatus(authorizationStatus)
        
        if authorizationStatus == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    func handleAuthorizationStatus(_ status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .restricted, .denied:
            currentCity = "Unavailable"
            break
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.first else { return }
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Error in reverseGeocode: \(error.localizedDescription)")
                return
            }
            
            guard let placemark = placemarks?.first else { return }
            
            if let city = placemark.locality {
                self.currentCity = city
            } else {
                self.currentCity = "Unknown"
            }
            
            if let location = placemark.location {
                self.currentLocation = "\(location.coordinate.latitude),\(location.coordinate.longitude)"
            }
        }
        hasLocationLoaded = true
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
        self.error = error
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        handleAuthorizationStatus(manager.authorizationStatus)
    }
}

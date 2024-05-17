//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by Tom Golding on 12/5/2024.
//

import Foundation
import CoreLocation

enum FocusedView {
    case searchBarFocused
    case mainViewFocused
}

class MainViewModel:  NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    @Published var userLocation: CLLocation?
    @Published var savedData: [String] = []
    @Published var focusedState: FocusedView = .mainViewFocused
    @Published var locationAuthorizationStatus: CLAuthorizationStatus = .notDetermined

    private let SAVED_DATA_KEY = "SavedData"
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    func requestLocation() -> Void {
        locationManager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) -> Void {
        if let location = locations.last {
            DispatchQueue.main.async {
                self.userLocation = location
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) -> Void {
        DispatchQueue.main.async {
            self.locationAuthorizationStatus = status
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) -> Void {
        print("Failed to fetch location: \(error.localizedDescription)")
    }
    func retrieveSavedData() -> Void {
        if let location = self.userLocation, !isLocationAlreadySaved(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)  {
            self.savedData.append("\(location.coordinate.latitude),\(location.coordinate.longitude)")
        }
        if let array = UserDefaults.standard.array(forKey: self.SAVED_DATA_KEY) as? [String] {
            array.forEach{ data in
                self.savedData.append(data)
            }
        }
        
    }
    func addSavedLocation(latitude: Double, longitude: Double) -> Void {
        if(!isLocationAlreadySaved(latitude: latitude, longitude: longitude)) {
            self.savedData.append("\(latitude),\(longitude)")
            self.saveData()
        }
    }

    func isLocationAlreadySaved(latitude: Double, longitude: Double) -> Bool {
        if let array = UserDefaults.standard.array(forKey: self.SAVED_DATA_KEY) as? [String] {
            return array.contains("\(latitude),\(longitude)");
        }
        return false
    }
    func removeSavedLocation(latitude: Double, longitude: Double) -> Void {
        for i in 0..<self.savedData.count  {
            if self.savedData[i] == "\(latitude),\(longitude)" {
                self.savedData.remove(at: i)
                self.saveData()
                break
            }
        }
    }
    private func saveData() -> Void {
        self.objectWillChange.send()
        UserDefaults.standard.set(self.savedData, forKey: self.SAVED_DATA_KEY)
    }
}

//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by Tom Golding on 12/5/2024.
//

import Foundation
import CoreLocation

class MainViewModel:  NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    @Published var userLocation: CLLocation?
    
//    @Published var savedData = NSMutableOrderedSet(set:  Set<String>()) // IDs or Long/Lat -> gotta suss it out
    @Published var savedData: [String] = []
    @Published var locationAuthorizationStatus: CLAuthorizationStatus = .notDetermined

    private let SAVED_DATA_KEY = "SavedData"
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        self.savedData.append("Sydney")
        self.savedData.append("Melbourne")
        self.savedData.append("Beijing")
        self.savedData.append("Campbelltown")
        self.savedData.append("Brisbane")
        self.savedData.append("Paris")
        self.savedData.append("Kuala Lumpar")
    }

    func requestLocation() {
        locationManager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            DispatchQueue.main.async {
                self.userLocation = location
//                self.savedData.add("\(location.coordinate.latitude),\(location.coordinate.longitude)")

            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        DispatchQueue.main.async {
            self.locationAuthorizationStatus = status
        }
    }
    

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to fetch location: \(error.localizedDescription)")
    }
    
//    func getSortedSavedDataList() -> [String] {
//        self.retrieveSavedData()
//        let savedDataArr = Array(savedData)
//        return savedDataArr.sorted()
//    }
    
    func retrieveSavedData() {
        if let location = self.userLocation {
//            self.savedData.add("\(location.coordinate.latitude),\(location.coordinate.longitude)")
            self.savedData.append("\(location.coordinate.latitude),\(location.coordinate.longitude)")
            
        }
        if let array = UserDefaults.standard.array(forKey: self.SAVED_DATA_KEY) as? [String] {
            array.forEach{ data in
//                self.savedData.add(data)
                self.savedData.append(data)
            }
        }
        
    }
        
    func addSavedLocation(latitude: Double, longitude: Double) {
        self.savedData.append("\(latitude),\(longitude)")
        self.saveData()
    }
    
    func removeSavedLocation(latitude: Double, longitude: Double) {
        for i in 0..<self.savedData.count  {
            if self.savedData[i] == "\(latitude),\(longitude)" {
                self.savedData.remove(at: i)
            }
        }
//        self.savedData.remove("\(latitude),\(longitude)")
        self.saveData()
    }
    
    private func saveData() {
//        let array = Array(self.savedData)
        UserDefaults.standard.set(self.savedData, forKey: self.SAVED_DATA_KEY)
    }
}

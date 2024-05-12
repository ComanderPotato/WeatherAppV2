//
//  DataSavingViewModel.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import Foundation

class DataSavingManager: ObservableObject {
    private var savedData = Set<String>() // IDs or Long/Lat -> gotta suss it out
    private let savedDataKey = "SavedData"
    
    init() {
        /*
         Testing - delete later
         */
        savedData.insert("Sydney")
        savedData.insert("Melbourne")
        savedData.insert("Beijing")
        savedData.insert("Campbelltown")
        savedData.insert("Brisbane")
        savedData.insert("Paris")
        savedData.insert("Kuala Lumpar")
    }
    
    func getSortedSavedDataList() -> [String] {
        retrieveSavedData()
        let savedDataArr = Array(savedData)
        return savedDataArr.sorted()
    }
    
    private func retrieveSavedData() {
        if let array = UserDefaults.standard.array(forKey: savedDataKey) as? [String] {
            savedData = Set(array)
        }
    }
        
    func addSavedLocation(forecastID: String) {
        savedData.insert(forecastID)
        saveData()
    }
    
    func removeSavedLocation(forecastID: String) {
        savedData.remove(forecastID)
        saveData()
    }
    
    private func saveData() {
        let array = Array(savedData)
        UserDefaults.standard.set(array, forKey: savedDataKey)
    }
}

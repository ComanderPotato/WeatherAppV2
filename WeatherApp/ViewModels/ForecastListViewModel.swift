//
//  ForecastListViewModel.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import Foundation

class ForecastListViewModel: ObservableObject {
    // generate forecast
    @Published var forecastVm = ForecastViewModel()
    //@Published var locationLoaded = false
    //@Published var forecast: ForecastData
    
    /*
    @Published var forecastData: ForecastData?
    @Published var locationName: String
    @Published var currentDegrees: Double
    @Published var loDegrees: Double
    @Published var hiDegrees: Double
    
     */
    
    init() {
    }
    
    
}

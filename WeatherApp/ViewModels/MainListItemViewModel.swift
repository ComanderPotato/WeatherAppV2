//
//  MainListItemViewModel.swift
//  WeatherApp
//
//  Created by Tom Golding on 13/5/2024.
//

import Foundation

class MainListItemViewModel: ObservableObject {
    @Published var forecastData: ForecastData? = nil
    @Published var timer: Int = 0
    init() {}
    
    func pruneHourlyForecasts() -> Void {
        guard var hourlyForecasts = self.forecastData?.forecast.forecastday.first?.hour else {
            return
        }
        let currentDate = Date()
        let currentHour = Calendar.current.component(.hour, from: currentDate)
        
        for _ in 0..<currentHour {
            if (!hourlyForecasts.isEmpty) {
                hourlyForecasts.removeFirst()
            }
        }
        self.forecastData!.forecast.forecastday[0].hour = hourlyForecasts
    }
    func updateForecastData() -> Void {
        self.timer += 1
        objectWillChange.send()
    }
    func fetchForecastData(location: String) async throws -> ForecastData {
        return try await apiCall(request: APIRequest.forecast, location: location)
    }
}

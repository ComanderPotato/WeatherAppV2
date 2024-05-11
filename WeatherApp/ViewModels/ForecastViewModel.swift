//
//  ForecastViewModel.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import Foundation

class ForecastViewModel: ObservableObject {
    @Published var forecastData: ForecastData? = nil
    init() {
        
    }
    func fetchForecast(location: String, days: String) async throws -> Void {
        self.forecastData = try await getForecastData(location: location, days: days)
    }
    func getForecastData<T: Codable>(location: String, days: String) async throws -> T {
        return try await apiCall(request: APIRequest.forecast, location: location, days: days)
    }
}

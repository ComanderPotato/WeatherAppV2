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
        Task {
            do {
//                try await viewModel.fetchForecast(location: location, days: days)
                self.forecastData = try await getForecastData(location: location, days: days)
                self.pruneHourlyForecasts()
            } catch RequestError.invalidURL {
                print("InvalidURL")
            } catch RequestError.invalidData {
                print("InvalidData")
            } catch RequestError.invalidResponse {
                print("InvalidResponse")
            } catch RequestError.bad {
                print("BOO")
            } catch {
                print("Invalid")
            }
        }
//            self.forecastData = try await getForecastData(location: location, days: days)
    }
    func pruneHourlyForecasts() -> Void {
        guard var hourlyForecasts = self.forecastData?.forecast.forecastday.first?.hour else {
            return
        }
        var currentDate = Date()
        let currentHour = Calendar.current.component(.hour, from: currentDate)
        
        for i in 0..<currentHour {
                hourlyForecasts.removeFirst()
        }
        self.forecastData!.forecast.forecastday[0].hour = hourlyForecasts
    }
    func getForecastData<T: Codable>(location: String, days: String) async throws -> T {
        return try await apiCall(request: APIRequest.forecast, location: location, days: days)
    }
    
    // blocking the thread - will fix this after presentation
    func waitForLocationToLoad() async {
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
        } catch {
            print("Error while waiting for location: \(error)")
        }
    }
}

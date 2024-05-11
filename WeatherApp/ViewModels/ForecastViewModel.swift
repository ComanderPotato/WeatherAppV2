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
    func getForecastData<T: Codable>(location: String, days: String) async throws -> T {
        return try await apiCall(request: APIRequest.forecast, location: location, days: days)
    }
}

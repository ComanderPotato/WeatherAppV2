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
    // blocking the thread - will fix this after presentation
    func waitForLocationToLoad() async {
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
        } catch {
            print("Error while waiting for location: \(error)")
        }
    }
}

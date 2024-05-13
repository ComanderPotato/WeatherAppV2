//
//  MainListItemViewModel.swift
//  WeatherApp
//
//  Created by Tom Golding on 13/5/2024.
//

import Foundation

class MainListItemViewModel: ObservableObject {
    @Published var forecastData: ForecastData? = nil
    @Published var hourlyForecasts: [Hour] = []
    init() {}
    
    func prepareHourlyForecasts() -> Void {
        guard let forecastData = self.forecastData else {
            return
        }
        guard !forecastData.forecast.forecastday.isEmpty else {
            return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

        if let localTimeDate = dateFormatter.date(from: forecastData.location.localtime) {
            
            let localTimeHour = Calendar.current.component(.hour, from: localTimeDate)
            print(localTimeHour)
            forecastData.forecast.forecastday.first!.hour.forEach { hourlyForecast in
                if let forecastDate = dateFormatter.date(from: hourlyForecast.time) {
                    let forecastHour = Calendar.current.component(.hour, from: forecastDate)
                    if localTimeHour <= forecastHour {
                        self.hourlyForecasts.append(hourlyForecast)
                    }
                }
            }
        }
        forecastData.forecast.forecastday[1].hour.forEach { hourlyForecast in
            if self.hourlyForecasts.count <= 24 {
                self.hourlyForecasts.append(hourlyForecast)

            }
        }
    }
    func updateForecastData() -> Void {
        objectWillChange.send()
    }
    func fetchForecastData(location: String) async throws -> ForecastData {
        return try await apiCall(request: APIRequest.forecast, location: location)
    }
}

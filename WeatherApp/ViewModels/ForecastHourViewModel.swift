//
//  ForecastHourViewModel.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import Foundation



class ForecastHourViewModel: ObservableObject {
    @Published var sunriseIndex: Int = 0
    @Published var sunsetIndex: Int = 1
    @Published var sunriseTime: String = ""
    @Published var sunsetTime: String = ""
    init() {}

    func configureSunriseAndSunset(astro: Astro) -> Void {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        guard let sunriseIndex = dateFormatter.date(from: astro.sunrise) else {
            return
        }
        self.sunriseIndex = Calendar.current.component(.hour, from: sunriseIndex)

        guard let sunsetIndex = dateFormatter.date(from: astro.sunset) else {
            return
        }
        self.sunsetIndex = Calendar.current.component(.hour, from: sunsetIndex)
         
        dateFormatter.dateFormat = "h:mma"
        guard let sunriseTime = dateFormatter.date(from: astro.sunrise) else {
            return
        }
        self.sunriseTime = dateFormatter.string(from: sunriseTime)
        guard let sunsetTime = dateFormatter.date(from: astro.sunset) else {
            return
        }
        self.sunsetTime = dateFormatter.string(from: sunsetTime)
    }
}

//
//  ForecastDayViewModel.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import Foundation

class ForecastDayViewModel: ObservableObject {
    @Published var weekLow: Int = Int.max
    @Published var weekHigh: Int = Int.min
    private let WEEK_LENGTH: Int = 7
    init() {}
    
    func setWeekLowAndHigh(forecastDays: [Forecastday]) -> Void {
        
        for i in 0...WEEK_LENGTH {
            let currentLow: Int = Int(forecastDays[i].day.mintempC)
            let currentHigh: Int = Int(forecastDays[i].day.maxtempC)
            self.weekLow = currentLow < self.weekLow ? currentLow : self.weekLow
            self.weekHigh = currentHigh > self.weekHigh ? currentHigh : self.weekHigh
        }
    }
}

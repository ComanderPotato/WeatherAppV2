//
//  ForecastHourItemViewModel.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import Foundation

class ForecastHourItemViewModel: ObservableObject {
    @Published var hour: String = ""
    @Published var meridiemIndicator: String = ""
    @Published var sunriseIndex: Int = 0
    @Published var sunsetIndex: Int = 0
    init() {}
    
    func formatTime(time: String) -> Void {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        if let time = dateFormatter.date(from: time) {
            
            let timeFormatted = Calendar.current.dateComponents([.hour, .minute], from: time)
            
            let pastOne: Bool = timeFormatted.hour! > 12
            let isNoon: Bool = timeFormatted.hour! >= 12
            self.hour = pastOne ? String(timeFormatted.hour! - 12) : timeFormatted.hour == 0 ? String(timeFormatted.hour! + 12) : String(timeFormatted.hour!)
            self.meridiemIndicator = isNoon ? "PM" : "AM"
        }
    }
    func setSunriseAndSunsetIndex(astro: Astro) -> Void {
        
    }
}

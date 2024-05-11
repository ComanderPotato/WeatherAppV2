//
//  ForecastDayItemViewModel.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import Foundation

class ForecastDayItemViewModel: ObservableObject {
    @Published var day: String = ""
    init() {}
    
    func formatDate(date: String) -> Void {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: date) {
            let weekdayFormatter = DateFormatter()
            weekdayFormatter.dateFormat = "EEE"
            self.day = weekdayFormatter.string(from: date)
        }
    }
}

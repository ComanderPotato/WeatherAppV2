//
//  ForecastListLocationViewModel.swift
//  WeatherApp
//
//  Created by Tom Golding on 12/5/2024.
//

import Foundation

class ForecastListLocationViewModel: ObservableObject {
    @Published var time: String? = ""
    init() {
        
    }
    
    func formatTime(time: String) -> Void {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        if let date = dateFormatter.date(from: time) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "h:mm a"
            self.time = timeFormatter.string(from: date)
        }
    }
}

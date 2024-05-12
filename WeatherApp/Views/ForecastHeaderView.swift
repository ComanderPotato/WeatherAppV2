//
//  WeatherHeaderView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastHeaderView: View {
    let location: Location
    let forecastDay: Forecastday
    let isCurrentLocation: Bool
    var body: some View {
        VStack {
            Text(isCurrentLocation ? "My Location" : location.name)
                .font(.system(size: 40, weight: Font.Weight.light))
            Text(location.name.uppercased())
                .font(.system(size: 20, weight: Font.Weight.light))
            Text("\(String(format: "%.0f", forecastDay.hour.first!.tempC))°")
                .font(.system(size: 50, weight: Font.Weight.light))
            Text(forecastDay.hour.first!.condition.text)
            
            Text("L: \(String(format: "%.0f", forecastDay.day.mintempC))° H: \(String(format: "%.0f", forecastDay.day.maxtempC))°")
        }
//        .padding(.vertical, 50)
    }
}

#Preview {
    ForecastHeaderView(location: createDummyLocation(), forecastDay: createDummyForecastday(), isCurrentLocation: true)
}

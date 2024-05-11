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
    var body: some View {
        VStack {
            Text("My Location")
            Text(location.name)
            Text(forecastDay.hour.first!.tempC.formatted())
            Text(forecastDay.hour.first!.condition.text)
            Text("L: \(forecastDay.day.mintempC.formatted()) H: \(forecastDay.day.maxtempC.formatted())")
        }
    }
}

#Preview {
    ForecastHeaderView(location: createDummyLocation(), forecastDay: createDummyForecastday())
}

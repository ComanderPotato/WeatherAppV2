//
//  WeatherHeaderView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastHeaderView: View {
    let isCurrentLocation: Bool
    @EnvironmentObject var mainListViewModel: MainListItemViewModel
    var body: some View {
        VStack {
            if let forecastData = mainListViewModel.forecastData, let hourlyForecasts = mainListViewModel.hourlyForecasts {
            Text(isCurrentLocation ? "My Location" : forecastData.location.name)
                .font(.system(size: 40, weight: Font.Weight.light))
            if isCurrentLocation {
                
                Text(forecastData.location.name.uppercased())
                    .font(.system(size: 20, weight: Font.Weight.light))
            }
                Text("\(String(format: "%.0f",  hourlyForecasts.first!.tempC))°")
                .font(.system(size: 50, weight: Font.Weight.light))
                Text(hourlyForecasts.first!.condition.text)
            
            Text("L: \(String(format: "%.0f",  forecastData.forecast.forecastday.first!.day.mintempC))° H: \(String(format: "%.0f", forecastData.forecast.forecastday.first!.day.maxtempC))°")
            } else {
                LoadingAnimationView()
            }
        }        
    }
}

#Preview {
    ForecastHeaderView(isCurrentLocation: true).environmentObject(MainListItemViewModel())
}

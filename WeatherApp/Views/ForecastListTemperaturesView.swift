//
//  ForecastListTemperaturesView.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import SwiftUI

struct ForecastListTemperaturesView: View {
    @EnvironmentObject var mainListViewModel: MainListItemViewModel

    var body: some View {
        if let forecastData = mainListViewModel.forecastData {
            VStack {
                Text("\(String(format: "%.0f", forecastData.current.tempC))°C")
                    .font(.title)
                HStack {
                    Text("L: \(String(format: "%.0f", forecastData.forecast.forecastday.first!.day.mintempC))°C")
                        .font(.caption)
                    Text("H: \(String(format: "%.0f", forecastData.forecast.forecastday.first!.day.maxtempC))°C")
                        .font(.caption)
                }
            }
        } else {
            LoadingAnimationView()
        }
        
    }
}

#Preview {
    ForecastListTemperaturesView().environmentObject(MainListItemViewModel())
}

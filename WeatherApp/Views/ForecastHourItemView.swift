//
//  ForecastHourItemView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastHourItemView: View {
    let forecastHour: Hour
    let index: Int
    @StateObject var viewModel = ForecastHourItemViewModel()
    var body: some View {
        VStack {
            VStack {
                Text(index == 0 ? "Now" : "\(viewModel.hour)\(viewModel.meridiemIndicator)")
            }
            Spacer()
            WeatherIconView(
                icon: forecastHour.condition.icon,
                dimensions: 50,
                chanceOfRain: forecastHour.chanceOfRain)
            Spacer()
            if forecastHour.chanceOfRain == 0 {
               Spacer()
                    .frame(height: 25)
            }
            Text("\(String(format: "%.0f", forecastHour.tempC))°C")
        }.onAppear {
            viewModel.formatTime(time: forecastHour.time)
        }
    }
}

#Preview {
    ForecastHourItemView(forecastHour: createDummyHour(), index: 0)
}

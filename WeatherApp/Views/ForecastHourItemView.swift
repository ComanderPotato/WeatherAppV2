//
//  ForecastHourItemView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastHourItemView: View {
    let forecastHour: Hour
    @StateObject var viewModel = ForecastHourItemViewModel()
    var body: some View {
        VStack {
            HStack {
                
                Text("\(viewModel.hour)\(viewModel.meridiemIndicator)")
            }
            WeatherIconView(icon: forecastHour.condition.icon)
            Text("\(String(format: "%.0f", forecastHour.tempC))°C")
        }.onAppear {
            viewModel.formatTime(time: forecastHour.time)
        }
    }
}

#Preview {
    ForecastHourItemView(forecastHour: createDummyHour())
}

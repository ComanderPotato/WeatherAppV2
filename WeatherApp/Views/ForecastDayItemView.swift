//
//  SwiftUIView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastDayItemView: View {
    let forecastDay: Forecastday
    let index: Int
    let minTemp: Int
    let maxTemp: Int
    @StateObject var viewModel = ForecastDayItemViewModel()
    var body: some View {
        HStack {
            Text(index == 0 ? "Today" : viewModel.day)
            Spacer()

            WeatherIconView(
                icon: forecastDay.day.condition.icon,
                dimensions: 35,
                chanceOfRain: forecastDay.day.dailyChanceOfRain
            )
            Spacer()
            Text("\(String(format: "%.0f", forecastDay.day.mintempC))°")
            ForecastTemperatureBarView(
                weeklyMinTemp: minTemp,
                weeklyMaxTemp: maxTemp,
                currentMinTemp: Int(forecastDay.day.mintempC),
                currentMaxTemp: Int(forecastDay.day.maxtempC),
                currentTemperature: Int(forecastDay.hour.first!.tempC),
                index: index)
            Text("\(String(format: "%.0f", forecastDay.day.maxtempC))°")
        }.onAppear{
            viewModel.formatDate(date: forecastDay.date)
        }
        .frame(height: 40)
        Divider()

        
        
    }
}

#Preview {
    ForecastDayItemView(forecastDay: createDummyForecastday(), index: 0, minTemp: 1, maxTemp: 20)
}

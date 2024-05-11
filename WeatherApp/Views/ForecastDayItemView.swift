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
    @StateObject var viewModel = ForecastDayItemViewModel()
    var body: some View {
        HStack {
            Text(index == 0 ? "Today" : viewModel.day)
            WeatherIconView(icon: forecastDay.day.condition.icon)
            
            Text(forecastDay.day.mintempC.formatted())
            Text(forecastDay.day.maxtempC.formatted())
        }.onAppear{
            viewModel.formatDate(date: forecastDay.date)
        }
      
        
        
    }
}

#Preview {
    ForecastDayItemView(forecastDay: createDummyForecastday(), index: 0)
}

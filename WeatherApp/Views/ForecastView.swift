//
//  WeatherDataView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastView: View {
    let isCurrentLocation: Bool
    @StateObject var viewModel = ForecastViewModel()
    @EnvironmentObject var mainListItemViewModel: MainListItemViewModel
    var body: some View {
        ZStack {
            if let forecastData = mainListItemViewModel.forecastData {
                ScrollView(showsIndicators: false) {
                    Spacer()
                        .frame(height: 20)
                    ForecastHeaderView(location: forecastData.location, forecastDay: forecastData.forecast.forecastday.first!, isCurrentLocation: isCurrentLocation)
                    Spacer()
                    

                        .frame(height: 50)
                    ForecastHourView(forecastDay: forecastData.forecast.forecastday.first!)
                    ForecastDayView(forecastDays: forecastData.forecast.forecastday)
                    
                }
            } else {
                LoadingAnimationView()
            }
        }.onAppear{
            print(mainListItemViewModel.timer)
            mainListItemViewModel.pruneHourlyForecasts()
            // RemoveMe
//            mainListItemViewModel.forecastData = createDummyForecastData()
        }
    }
}


#Preview {
    ForecastView(isCurrentLocation: true).environmentObject(MainListItemViewModel())
}

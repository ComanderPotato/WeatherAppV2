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
                    ForecastHourView().environmentObject(mainListItemViewModel)
                    ForecastDayView(forecastDays: forecastData.forecast.forecastday)
                    VStack {
                        HStack {
                            WidgetView(icon: "thermometer.medium", title: "FEELS LIKE", info: "19", description: "Similar to")
                            WidgetView(icon: "drop.fill", title: "FEELS LIKE", info: "19", description: "Similar to")
                        }
                        HStack {
                            WidgetView(icon: "eye.fill", title: "FEELS LIKE", info: "19", description: "Similar to")
                            WidgetView(icon: "humidity.fill", title: "FEELS LIKE", info: "19", description: "Similar to")
                        }
                    }
                }
            } else {
                LoadingAnimationView()
            }
        }.onAppear{
            mainListItemViewModel.prepareHourlyForecasts()
            // RemoveMe
//            mainListItemViewModel.forecastData = createDummyForecastData()
        }
        .padding()
    }
}


#Preview {
    ForecastView(isCurrentLocation: true).environmentObject(MainListItemViewModel())
}

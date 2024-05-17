//
//  ForecastDayView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastDayView: View {
    @StateObject var viewModel = ForecastDayViewModel()
    @EnvironmentObject var mainListItemViewModel: MainListItemViewModel
    var body: some View {
        ZStack {
            if let forecastData = mainListItemViewModel.forecastData {
                    VStack {
                        if viewModel.weekLow != Int.max {

                        HStack {
                            Image(systemName: "calendar")
                            Text("10 DAY FORECAST")
                            Spacer()
                        }
                        Divider()
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                ForEach(forecastData.forecast.forecastday.indices, id: \.self) { index in
                                    ForecastDayItemView(forecastDay: forecastData.forecast.forecastday[index], index: index, minTemp: viewModel.weekLow, maxTemp: viewModel.weekHigh)
                                }
                            }
                        }
                    }
                }
                    .padding().onAppear(perform: {
                    viewModel.setLowAndHighTemperature(forecastDays: forecastData.forecast.forecastday)
                })
            }else {
                LoadingAnimationView()
            }
        }.background(RoundedRectangle(cornerRadius: 10).fill(.thickMaterial))
            
        
    }
}

#Preview {
    ForecastDayView().environmentObject(MainListItemViewModel()
    )
}

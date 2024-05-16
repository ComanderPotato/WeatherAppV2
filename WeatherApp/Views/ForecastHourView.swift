//
//  ForecastHourView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastHourView: View {
    @StateObject var viewModel = ForecastHourViewModel()
    @EnvironmentObject var mainListItemViewModel: MainListItemViewModel
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "clock")
                    Text("HOURLY FORECAST")
                    Spacer()
                }
                
                Divider()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(mainListItemViewModel.hourlyForecasts.indices, id: \.self) { index in
                            ForecastHourItemView(forecastHour: mainListItemViewModel.hourlyForecasts[index], index: index)
                            if viewModel.isSunrise(time: mainListItemViewModel.hourlyForecasts[index].time) {
                                SunIconView(title: "Sunrise", time: viewModel.sunriseTime, isSunRise: true)
                            }
                            if viewModel.isSunset(time: mainListItemViewModel.hourlyForecasts[index].time) {
                                SunIconView(title: "Sunset", time: viewModel.sunsetTime, isSunRise: false)
                            }
                            
                        }
                        

                    }
                }.padding(.vertical)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.thickMaterial))
                .onAppear {
                    if let astroData = mainListItemViewModel.forecastData!.forecast.forecastday.first?.astro {
                        viewModel.configureSunriseAndSunset(astro: astroData)
                    }
                }
            }
    }
}

#Preview {
    ForecastHourView().environmentObject(MainListItemViewModel())
}

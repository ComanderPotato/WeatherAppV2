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
            if let hourlyForecasts = mainListItemViewModel.hourlyForecasts {
                VStack {
                    HStack {
                        Image(systemName: "clock")
                        Text("HOURLY FORECAST")
                        Spacer()
                    }
                    
                    Divider()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(hourlyForecasts.indices, id: \.self) { index in
                                ForecastHourItemView(forecastHour: hourlyForecasts[index], index: index)
                                if viewModel.isSunrise(time: hourlyForecasts[index].time) {
                                    SunIconView(title: "Sunrise", time: viewModel.sunriseTime, isSunRise: true)
                                }
                                if viewModel.isSunset(time: hourlyForecasts[index].time) {
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
            } else {
                LoadingAnimationView()
            }
        }
    }
}

#Preview {
    ForecastHourView().environmentObject(MainListItemViewModel())
}

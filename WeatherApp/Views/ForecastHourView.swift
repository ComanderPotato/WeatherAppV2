//
//  ForecastHourView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastHourView: View {
    let forecastDay: Forecastday
    @StateObject var viewModel = ForecastHourViewModel()
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
                        ForEach(forecastDay.hour.indices, id: \.self) { index in
                            ForecastHourItemView(forecastHour: forecastDay.hour[index], index: index)
                            if(index == viewModel.sunriseIndex) {
                                SunIconView(title: "Sunrise", time: viewModel.sunriseTime,
                                            icon: "//cdn3.iconfinder.com/data/icons/weather-ios-11-1/50/Sunrise_Sun_Daybreak_Down_Morning_Apple_Weather-1024.png")
                            } else if(index == viewModel.sunsetIndex) {
                                SunIconView(title: "Sunset", time: viewModel.sunsetTime,
                                            icon: "//cdn3.iconfinder.com/data/icons/weather-ios-11-1/50/Sunset_Nightfall_Sundown_Dusk_Twilight_Apple_Weather-1024.png")
                            }
                        }
                    }
                }.padding(.vertical)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.thickMaterial))
                .onAppear {
                    viewModel.configureSunriseAndSunset(astro: forecastDay.astro)
                }
            }
    }
}

#Preview {
    ForecastHourView(forecastDay: createDummyForecastday())
}

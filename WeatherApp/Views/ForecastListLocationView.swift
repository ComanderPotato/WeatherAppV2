//
//  ForecastListLocationView.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import SwiftUI

struct ForecastListLocationView: View {
    let currentWeatherData: WeatherData
    let isCurrentLocation: Bool
    @StateObject var viewModel = ForecastListLocationViewModel()
    var body: some View {
            VStack {
                HStack {
                    Text(isCurrentLocation ? "My Location" : currentWeatherData.location.name)
                        .font(.largeTitle.bold())
                        .lineLimit(1)
                        .minimumScaleFactor(0.2)
                        .background(.clear, in: RoundedRectangle(cornerRadius: 7, style: .continuous))
                    Spacer()
                }
                HStack {
                    Text(isCurrentLocation ? currentWeatherData.location.name :  viewModel.time!)
                    Spacer()
                }
                Spacer()
                HStack {
                    Text(currentWeatherData.current.condition.text)
                    Spacer()
                }
            }.onAppear {
                viewModel.formatTime(time: currentWeatherData.location.localtime)
            }
//            WeatherIconView(icon: createDummyCondition().icon, dimensions: 50, chanceOfRain: 0)
    }
} 


#Preview {
    ForecastListLocationView(
        currentWeatherData: createDummyWeatherData(),
        isCurrentLocation: true)
}


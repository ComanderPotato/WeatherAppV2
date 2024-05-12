//
//  ForecastListLocationView.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import SwiftUI

struct ForecastListLocationView: View {
    @EnvironmentObject var mainListViewModel: MainListItemViewModel
    let isCurrentLocation: Bool
    @StateObject var viewModel = ForecastListLocationViewModel()
    var body: some View {
        if let forecastData = mainListViewModel.forecastData {
            VStack {
                HStack {
                    Text(isCurrentLocation ? "My Location" : forecastData.location.name)
                        .font(.largeTitle.bold())
                        .lineLimit(1)
                        .minimumScaleFactor(0.2)
                        .background(.clear, in: RoundedRectangle(cornerRadius: 7, style: .continuous))
                    Spacer()
                }
                HStack {
                    Text(isCurrentLocation ? forecastData.location.name :  viewModel.time!)
                    Spacer()
                }
                Spacer()
                HStack {
                    Text(forecastData.current.condition.text)
                    Spacer()
                }
            }.onAppear {
                viewModel.formatTime(time: forecastData.location.localtime)
            }
        } else {
            LoadingAnimationView()
        }
            
//            WeatherIconView(icon: createDummyCondition().icon, dimensions: 50, chanceOfRain: 0)
    }
} 


#Preview {
    ForecastListLocationView(
        isCurrentLocation: true).environmentObject(MainListItemViewModel())
}


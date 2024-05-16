//
//  WeatherDataListView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastListView: View {
    @EnvironmentObject var mainListViewModel: MainListItemViewModel
    let isCurrentLocation: Bool
    var body: some View {
        ZStack {
            HStack {
                if mainListViewModel.forecastData != nil {
                    HStack {
                        ForecastListLocationView(
                            isCurrentLocation: isCurrentLocation).environmentObject(mainListViewModel)
                        Spacer()
                        ForecastListTemperaturesView().environmentObject(mainListViewModel)
                    }
                } else {
                    LoadingAnimationView()
                }
            }
            .padding()
            .frame(width: 360)
            .foregroundStyle(Color("TextColour"))
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 7, style: .continuous))
        }
    }
}

#Preview {
    ForecastListView(isCurrentLocation: false).environmentObject(MainListItemViewModel())
}

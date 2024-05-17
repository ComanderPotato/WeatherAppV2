//
//  WeatherDataView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastView: View {
    let isCurrentLocation: Bool
    @EnvironmentObject var mainListItemViewModel: MainListItemViewModel
    var body: some View {
        ZStack {
                ScrollView(showsIndicators: false) {
                    Spacer()
                        .frame(height: 20)
                    ForecastHeaderView(isCurrentLocation: isCurrentLocation).environmentObject(mainListItemViewModel)
                    Spacer()
                        .frame(height: 50)
                    ForecastHourView().environmentObject(mainListItemViewModel)
                    ForecastDayView().environmentObject(mainListItemViewModel)
                }

        }.onAppear{
            mainListItemViewModel.prepareHourlyForecasts()
        }
        .padding()
    }
}


#Preview {
    ForecastView(isCurrentLocation: true).environmentObject(MainListItemViewModel())
}

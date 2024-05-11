//
//  ForecastDayView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastDayView: View {
    let forecastDays: [Forecastday]
    @StateObject var viewModel = ForecastDayViewModel()
    var body: some View {
        VStack {
            Text("10 DAY FORECAST")
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(forecastDays.indices, id: \.self) { index in
                        ForecastDayItemView(forecastDay: forecastDays[index], index: index)
                    }
                }
            }.padding(.vertical)
            
        }.background(RoundedRectangle(cornerRadius: 10).fill(.thickMaterial))
            .onAppear(perform: {
                viewModel.setWeekLowAndHigh(forecastDays: forecastDays)
            })
        
    }
}

#Preview {
    ForecastDayView(forecastDays: [createDummyForecastday(),
                                   createDummyForecastday(),
                                   createDummyForecastday(),
                                   createDummyForecastday(),
                                   createDummyForecastday(),
                                   createDummyForecastday(),
                                   createDummyForecastday(),
                                   createDummyForecastday()])
}

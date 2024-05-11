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
        ZStack {
            if viewModel.weekLow != Int.max {
                VStack {
                    
                HStack {
                    Image(systemName: "calendar")
                    Text("10 DAY FORECAST")
                    Spacer()
                }
                Divider()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(forecastDays.indices, id: \.self) { index in
                            ForecastDayItemView(forecastDay: forecastDays[index], index: index, minTemp: viewModel.weekLow, maxTemp: viewModel.weekHigh)
                        }
                    }
                }
                }.padding()
            } else {
                LoadingAnimationView()
            }
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
                                   createDummyForecastday()]
    )
}

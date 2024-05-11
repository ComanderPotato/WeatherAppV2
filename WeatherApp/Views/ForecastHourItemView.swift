//
//  ForecastHourItemView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastHourItemView: View {
    let forecastHour: Hour
    @StateObject var viewModel = ForecastHourItemViewModel()
    var body: some View {
        VStack {
            HStack {
                
                Text(viewModel.hour)
                Text(viewModel.meridiemIndicator)
                
            }
            AsyncImage(url: URL(string: "https:" + (forecastHour.condition.icon))) { image in
                image.resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            } placeholder: {
                Circle()
                    .foregroundColor(.primary)
            }
            Text("\(String(format: "%.0f", forecastHour.tempC))°C")
        }.onAppear {
            viewModel.formateTime(time: forecastHour.time)
        }
    }
}

#Preview {
    ForecastHourItemView(forecastHour: createDummyHour())
}

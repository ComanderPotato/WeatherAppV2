//
//  ForecastHourView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastHourView: View {
    let forecastHours: [Hour]
    var body: some View {
        VStack {
            Text("HOURLY FORECAST")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(forecastHours.indices, id: \.self) { index in
                        ForecastHourItemView(forecastHour: forecastHours[index])
                    }
                }
            }.padding(.vertical)
            
        }.background(RoundedRectangle(cornerRadius: 10).fill(.thickMaterial))
        
    }
}

#Preview {
    ForecastHourView(forecastHours: [createDummyHour()])
}

//
//  ForecastListTemperaturesView.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import SwiftUI

struct ForecastListTemperaturesView: View {
    let currentDegrees: Double
    let loDegrees: Double
    let hiDegrees: Double
    
    var body: some View {
        VStack {
            Text("\(String(format: "%.0f", currentDegrees))°C")
                .font(.title)
            HStack {
                Text("L: \(String(format: "%.0f", loDegrees))°C")
                    .font(.caption)
                Text("H: \(String(format: "%.0f", hiDegrees))°C")
                    .font(.caption)
            }
        }
    }
}

#Preview {
    ForecastListTemperaturesView(currentDegrees: 20.0, loDegrees: 10.0, hiDegrees: 30.0)
}

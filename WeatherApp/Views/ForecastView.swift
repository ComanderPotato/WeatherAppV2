//
//  WeatherDataView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastView: View {
    @StateObject var viewModel = ForecastViewModel()
    let location: String
    let days: String
    var body: some View {
        ZStack {
            if let forecast = viewModel.forecastData {
                VStack {
                    ForecastHeaderView(location: forecast.location, forecastDay: forecast.forecast.forecastday.first!)
                    ForecastHourView(forecastHours: forecast.forecast.forecastday.first!.hour)
                }
            } else {
                Circle()
                    .foregroundColor(.primary)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Rectangle())
            }
        }.task {
            do {
                try await viewModel.fetchForecast(location: location, days: days)
            } catch RequestError.invalidURL {
                print("InvalidURL")
            } catch RequestError.invalidData {
                print("InvalidData")
            } catch RequestError.invalidResponse {
                print("InvalidResponse")
            } catch RequestError.bad {
                print("BOO")
            } catch {
                print("Invalid")
            }
        }
    }
}

#Preview {
    ForecastView(location: "Sydney", days: "1")
}

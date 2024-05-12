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
                ScrollView(showsIndicators: false) {
                    Spacer()
                        .frame(height: 20)
                    ForecastHeaderView(location: forecast.location, forecastDay: forecast.forecast.forecastday.first!)
                    Spacer()
                        .frame(height: 50)
                    ForecastHourView(forecastDay: forecast.forecast.forecastday.first!)
                    ForecastDayView(forecastDays: forecast.forecast.forecastday)
                    ForecastDayView(forecastDays: forecast.forecast.forecastday)
                    
                }
            } else {
                LoadingAnimationView()
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
    ForecastView(location: "Sydney", days: "10")
}

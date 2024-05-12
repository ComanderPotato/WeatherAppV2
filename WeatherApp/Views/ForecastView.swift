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
    let isCurrentLocation: Bool
    var body: some View {
        ZStack {
            if let forecast = viewModel.forecastData {
            
                ScrollView(showsIndicators: false) {
                    Spacer()
                        .frame(height: 20)
                    ForecastHeaderView(location: forecast.location, forecastDay: forecast.forecast.forecastday.first!, isCurrentLocation: isCurrentLocation)
                    Spacer()
                        .frame(height: 50)
                    ForecastHourView(forecastDay: forecast.forecast.forecastday.first!)
                    ForecastDayView(forecastDays: forecast.forecast.forecastday)
                    
                }
            } else {
                LoadingAnimationView()
            }
        }.onAppear{
            Task {
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
}


#Preview {
    ForecastView(location: "Sydney,Miranda", days: "10", isCurrentLocation: false)
}

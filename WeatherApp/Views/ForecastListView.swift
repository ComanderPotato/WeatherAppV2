//
//  WeatherDataListView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ForecastListView: View {
    @StateObject var viewModel = ForecastViewModel()
    let inputLocation: String
    let isCurrentLocation: Bool
    var body: some View {
        ZStack {
            HStack {
                if let forecast = viewModel.forecastData {
                    HStack {
                        ForecastListLocationView(
                            currentWeatherData: WeatherData(location: forecast.location, current: forecast.current), isCurrentLocation: isCurrentLocation)
                        Spacer()
                        ForecastListTemperaturesView(
                            currentDegrees: forecast.current.tempC,
                            loDegrees: forecast.forecast.forecastday.first?.day.mintempC ?? 0.00,
                            hiDegrees: forecast.forecast.forecastday.first?.day.maxtempC ?? 0.00)
                    }
                } else {
                    LoadingAnimationView()
                }
            }
            .padding()
            .frame(width: 360)
            .foregroundStyle(Color("TextColour"))
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 7, style: .continuous))
            .onAppear {
                Task {
                    do {
                        try await viewModel.fetchForecast(location: inputLocation, days: "1")
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
}

#Preview {
    ForecastListView(inputLocation: "Sydney", isCurrentLocation: false)
}

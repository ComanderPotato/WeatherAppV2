//
//  MainHeaderView.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import SwiftUI

// show current location weather
    // should maybe store the last generated location as userdefault

struct MainCurrentLocationHeaderView: View {
    @StateObject var viewModel = ForecastViewModel()
    @StateObject var currentLocationManager = CurrentLocationManager()
    
    var inputLocation: String
    var body: some View {
        ZStack {
            HStack {
                if let forecast = viewModel.forecastData {
                    HStack {
                        VStack{
                            Text("Current Location")
                            ForecastListLocationView(
                                locationName: forecast.location.name,
                                iconString: forecast.current.condition.icon)
                        }
                        
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
            .task {
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

#Preview {
    MainCurrentLocationHeaderView(inputLocation: "Alice Springs")
}

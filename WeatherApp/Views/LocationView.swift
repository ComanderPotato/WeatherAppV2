//
//  LocationView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI


struct LocationView: View {
    @StateObject var viewModel = LocationViewModel()
    @State private var forecastData: ForecastData?
    var body: some View {
        ZStack {
            ForecastHeaderView(
                location: forecastData?.location ?? createDummyLocation(),
                forecastDay: forecastData?.forecast.forecastday.first ?? createDummyForecastday(), isCurrentLocation: true)
        }.task {
            do {
                forecastData = try await viewModel.getForecastData(location: "Sydney, Ultimo", days: "5")
    
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
    LocationView()
}

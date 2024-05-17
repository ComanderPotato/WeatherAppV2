//
//  MainListItemView.swift
//  WeatherApp
//
//  Created by Tom Golding on 13/5/2024.
//

import SwiftUI

struct MainListItemView: View {
    let location: String
    let isCurrentLocation: Bool
    @StateObject var viewModel = MainListItemViewModel()
    @EnvironmentObject var mainViewModel: MainViewModel
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
        .map { _ in Date() }
    var body: some View {
        VStack {
            if let forecastData = viewModel.forecastData {
                NavigationLink(destination: ForecastView(isCurrentLocation: isCurrentLocation).environmentObject(viewModel).toolbar {
                        if(mainViewModel.isLocationAlreadySaved(latitude: forecastData.location.lat, longitude: forecastData.location.lon)) {
                            Button("Remove") {
                                mainViewModel.removeSavedLocation(latitude: forecastData.location.lat, longitude: forecastData.location.lon)
                            }
                        }
                }) {
                    ForecastListView(isCurrentLocation: isCurrentLocation)
                        .environmentObject(viewModel)
                }
            } else {
                LoadingAnimationView()
            }
        }.onReceive(timer.throttle(for: .seconds(60), scheduler: DispatchQueue.main, latest: true)) { _ in
            Task {
                do {
                    viewModel.forecastData =  try await viewModel.fetchForecastData(location: location)
                    viewModel.updateForecastData()
                } catch RequestError.invalidURL {
                    print("InvalidURL")
                } catch RequestError.invalidData {
                    print("InvalidData")
                } catch RequestError.invalidResponse {
                    print("InvalidResponse")
                } catch {
                    print("Invalid")
                }
            }
        }
    }
}

#Preview {
                    MainListItemView(location: "Sydney", isCurrentLocation: true).environmentObject(MainViewModel())
}

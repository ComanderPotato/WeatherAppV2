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
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
        .map { _ in Date() }
    var body: some View {
        VStack {
            if viewModel.forecastData != nil {
                NavigationLink(destination: ForecastView(isCurrentLocation: isCurrentLocation).environmentObject(viewModel)) {
                    ForecastListView(isCurrentLocation: isCurrentLocation)
                        .environmentObject(viewModel)
                }
            } else {
                LoadingAnimationView()
            }
        }.onReceive(timer.throttle(for: .seconds(60), scheduler: DispatchQueue.main, latest: true)) { _ in
            //        }.onReceive(timer.throttle(for: 60, scheduler: DispatchQueue.main, latest: true)) { _ in
            Task {
                // Your code to fetch data goes here
                do {
                    viewModel.forecastData = try await viewModel.fetchForecastData(location: location)
                    viewModel.updateForecastData()
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
    MainListItemView(location: "Sydney", isCurrentLocation: true)
}

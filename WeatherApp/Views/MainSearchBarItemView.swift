//
//  MainSearchBarItemView.swift
//  WeatherApp
//
//  Created by Tom Golding on 13/5/2024.
//

import SwiftUI
import Combine
struct MainSearchBarItemView: View {
    let queriedLocation: QueryLocation
    @StateObject var viewModel = MainListItemViewModel()
    @EnvironmentObject var mainViewModel: MainViewModel
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    var body: some View {
                NavigationLink(destination: ForecastView(isCurrentLocation: false).environmentObject(viewModel).toolbar {
                    if(!mainViewModel.isLocationAlreadySaved(latitude: queriedLocation.lat, longitude: queriedLocation.lon)) {
                        Button("Add") {
                            mainViewModel.addSavedLocation(latitude: queriedLocation.lat, longitude: queriedLocation.lon)
                        }
                    }
                }) {
                    HStack {
                    Text("\(queriedLocation.name), \(queriedLocation.region) \(queriedLocation.country)")
                        .lineLimit(1)
                        .truncationMode(.tail)
                        Spacer()
                    }.padding()
                }
        .task {
            do {
                viewModel.forecastData =  try await viewModel.fetchForecastData(location: queriedLocation.name)
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

#Preview {
    MainSearchBarItemView(queriedLocation: createDummyQueryLocation()).environmentObject(MainViewModel())
}

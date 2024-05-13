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
    @State var hasFinishedLoading: Bool = false
    @StateObject var viewModel = MainListItemViewModel()
    @EnvironmentObject var mainViewModel: MainViewModel
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()

    var body: some View {
                NavigationLink(destination: ForecastView(isCurrentLocation: false).environmentObject(viewModel).toolbar {
                    Button("Add") {
                        // Code to add to local storage
                        // Also need to check if not in local storage
                        mainViewModel.addSavedLocation(latitude: queriedLocation.lat, longitude: queriedLocation.lon)
                        print("Added")
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
            } catch RequestError.bad {
                print("BOO")
            } catch {
                print("Invalid")
            }
        }
        
    }
}

#Preview {
    MainSearchBarItemView(queriedLocation: createDummyQueryLocation()).environmentObject(MainViewModel())
}

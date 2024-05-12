//
//  MainListView.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import SwiftUI

struct MainListView: View {
    @StateObject var viewModel = ForecastViewModel()
    @EnvironmentObject var mainViewModel: MainViewModel
    @State var hasFirst: Bool = false
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                ForEach(Array(mainViewModel.savedData.enumerated()), id: \.element) { index, item in
                    MainListItemView(location: item, isCurrentLocation: hasFirst && index == 0)
//                    NavigationLink(destination: ForecastView(location: item, days: "10", isCurrentLocation: hasFirst && index == 0)) {
//                        ForecastListView(inputLocation: item, isCurrentLocation: hasFirst && index == 0)
//                    }
                }
                Spacer()
            }
        }.onAppear {
            hasFirst = mainViewModel.locationAuthorizationStatus != .notDetermined
        }
    }
}

#Preview {
    MainListView().environmentObject(MainViewModel())
}

//struct MainListView: View {
//    @StateObject var viewModel = ForecastViewModel()
//    @StateObject var currentLocationManager = CurrentLocationManager()
//    @StateObject var dataSavingManager = DataSavingManager()
//    @EnvironmentObject var mainViewModel: MainViewModel
//    var body: some View {
//        NavigationStack{
//            if let forecast = viewModel.forecastData {
//                VStack(alignment: .leading) {
//                    NavigationLink(destination: ForecastView(location: forecast.location.name, days: "10", isCurrentLocation: true)) {
//                        ForecastListView(inputLocation: forecast.location.name, isCurrentLocation: true)
//                    }
//                    ForEach(dataSavingManager.getSortedSavedDataList(), id: \.self) { item in
//                        NavigationLink(destination: ForecastView(location: item, days: "10", isCurrentLocation: false)) {
//                            ForecastListView(inputLocation: item, isCurrentLocation: false)
//                        }
//                    }
//                }
//                Spacer()
//                
//            } else {
//                LoadingAnimationView()
//            }
//        }.onAppear {
//            currentLocationManager.onViewDidLoad()
//        Task {
//            do {
//                await viewModel.waitForLocationToLoad()
//                try await viewModel.fetchForecast(location: currentLocationManager.currentLocation, days: "1")
//            } catch RequestError.invalidURL {
//                print("InvalidURL")
//            } catch RequestError.invalidData {
//                print("InvalidData")
//            } catch RequestError.invalidResponse {
//                print("InvalidResponse")
//            } catch RequestError.bad {
//                print("BOO")
//            } catch {
//                print("Invalid")
//            }
//        }
//        }
//    }
//}
//
//#Preview {
//    MainListView().environmentObject(MainViewModel())
//}

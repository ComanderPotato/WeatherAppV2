//
//  MainView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
    
        
        ZStack {
            if viewModel.locationAuthorizationStatus != .notDetermined {
                NavigationStack {
                    ScrollView(showsIndicators: false) {
                        VStack {
                            // search
                            MainSearchBarView() {
                                MainListView()
                                    .environmentObject(viewModel)
                            }
                                .environmentObject(viewModel)
                            // listview
                            
                            Spacer()
                        }
                    }
                }.onAppear {
                    viewModel.retrieveSavedData()
//                    viewModel.savedData.forEach {data in
//                        print(data)
//                    }
                }
            } else {
                LoadingAnimationView()
            }
        }.onAppear {
            viewModel.requestLocation()
        }
    }
}

#Preview {
    MainView()
}

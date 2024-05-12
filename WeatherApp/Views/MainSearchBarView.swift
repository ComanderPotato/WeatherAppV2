//
//  MainSearchBoxView.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import SwiftUI

struct MainSearchBarView<Content: View>: View {
    @StateObject var viewModel = MainSearchBarViewModel()
    @EnvironmentObject var mainViewModel: MainViewModel
    @ViewBuilder let mainView: Content
//    let mainView: () -> some View
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.trailing, 8)
            TextField(
                    "Search",
                    text: $viewModel.searchQuery
            ).textInputAutocapitalization(.never)
                .onChange(of: viewModel.searchQuery) { newValue, _ in
                    Task {
                        do {
                            try await viewModel.queryResults()
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
//            UITextFieldWrapper(text: $viewModel.searchQuery)
//                .padding()
//                .disableAutocorrection(true)
//                .autocorrectionDisabled()
//                .autocapitalization(/*@START_MENU_TOKEN@*/ .none/*@END_MENU_TOKEN@*/)
//                .frame(width: 200, height: 30)
            Spacer()
        }
        .padding()
        .frame(width: 360)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 7, style: .continuous))
        if !viewModel.queriedResults.isEmpty {
//                NavigationStack {
            ZStack {
            
                    List {
                        ForEach(viewModel.queriedResults, id: \.self) { location in
                            
//                            NavigationLink(destination: ForecastView(isCurrentLocation: false).environmentObject(mainViewModel).toolbar {
//                                Button("Add") {
//                                    // Code to add to local storage
//                                    // Also need to check if not in local storage
//                                    mainViewModel.addSavedLocation(latitude: location.lat, longitude: location.lon)
//                                    print("Added")
//                                }
//                            }) {
//                                ForecastListView(inputLocation: item.name, isCurrentLocation: false)
                                Text("\(location.name), \(location.region) \(location.country)")
                                    .lineLimit(1)
                                    .truncationMode(.tail)
//                            }
                                
                        }
                    }
//                    }
                }
        } else {
            mainView
        }
    }
}

#Preview {
    MainSearchBarView(){
        
    }.environmentObject(MainViewModel())
}

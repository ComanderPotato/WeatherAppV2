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
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
                TextField(
                    "Search",
                    text: $viewModel.searchQuery
                ).textInputAutocapitalization(.never)
                    .onChange(of: viewModel.searchQuery) { newValue, _ in
                        if viewModel.searchQuery.count >= 3 {
                            Task {
                                do {
                                    viewModel.queriedResults = try await viewModel.fetchQueriedResults(searchQuery: viewModel.searchQuery)
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
                        } else {
                            viewModel.queriedResults = []
                        }
                    }
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 7, style: .continuous))
                if !viewModel.queriedResults.isEmpty {
                    ScrollView {
                        NavigationStack {
                            ForEach(viewModel.queriedResults, id: \.self) { queriedLocation in
                                MainSearchBarItemView(queriedLocation: queriedLocation).environmentObject(viewModel)
                            }
                        }
                    }
//                    List {
//                        ForEach(viewModel.queriedResults, id: \.self) { queriedLocation in
//                            MainSearchBarItemView(queriedLocation: queriedLocation).environmentObject(viewModel)
//                        }
//                    }
                }  else {
                    mainView
                }
        }.padding()
    }
}

#Preview {
    MainSearchBarView(){
        VStack {
            Text("Dummy")
        }
    }.environmentObject(MainViewModel())
}

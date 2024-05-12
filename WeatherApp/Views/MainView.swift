//
//  MainView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        // search
                        MainSearchBoxView()
                        // header
                        MainCurrentLocationHeaderView()
                            .padding()
                        // listview
                        MainListView()
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}

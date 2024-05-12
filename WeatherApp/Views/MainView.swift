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
            ScrollView(showsIndicators: false) {
                ZStack {
                    VStack {
                        // search
                        MainSearchBarView()
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

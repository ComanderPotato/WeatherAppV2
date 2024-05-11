//
//  ContentView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ForecastView(location: "Sydney", days: "10")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}




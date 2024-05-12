//
//  SearchView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct SearchView: View {
    @State var inputLocation: String
    var body: some View {
        Text("SearchView")
    }
}

#Preview {
    SearchView(inputLocation: "Perth")
}

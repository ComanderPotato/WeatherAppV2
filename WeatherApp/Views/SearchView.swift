//
//  SearchView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    @State var inputLocation: String
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                        
            }
        }
    }
}

#Preview {
    SearchView(inputLocation: "Perth")
}

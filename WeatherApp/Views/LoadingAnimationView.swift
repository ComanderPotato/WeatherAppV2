//
//  LoadingAnimationView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct LoadingAnimationView: View {
    @StateObject var viewModel = LoadingAnimationViewModel()
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: viewModel.cornerRadius)
                .foregroundStyle(.blue)
                .frame(width: viewModel.width, height: viewModel.height)
                .rotationEffect(.degrees(viewModel.rotation))
                .onAppear(perform: {
                    viewModel.startAnimating()
                })
        }
    }
}

#Preview {
    LoadingAnimationView()
}

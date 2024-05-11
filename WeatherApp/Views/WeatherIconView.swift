//
//  WeatherImageView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct WeatherIconView: View {
    let icon: String
    var body: some View {
        AsyncImage(url: URL(string: "https:" + (icon))) { image in
            image.resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        } placeholder: {
            LoadingAnimationView()
        }
    }
}

#Preview {
    WeatherIconView(icon: createDummyCondition().icon)
}

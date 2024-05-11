//
//  WeatherImageView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct WeatherIconView: View {
    let icon: String
    let dimensions: CGFloat
    let chanceOfRain: Int
    var body: some View {
        VStack {
            
        AsyncImage(url: URL(string: "https:" + (icon))) { image in
            image.resizable()
                .frame(width: dimensions, height: dimensions)
                .aspectRatio(contentMode: .fit)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        } placeholder: {
            LoadingAnimationView()
        }
            if chanceOfRain != 0 {
                Text("\(chanceOfRain)%")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.blue)
                    .offset(y: -8)
            }
        }
    }
}

#Preview {
    WeatherIconView(
        icon: createDummyCondition().icon,
        dimensions: 50,
        chanceOfRain: 1)
}

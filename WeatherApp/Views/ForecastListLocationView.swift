//
//  ForecastListLocationView.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import SwiftUI

struct ForecastListLocationView: View {
    let locationName: String
    let iconString: String

    var body: some View {
        HStack {
            Text(locationName)
                .font(.largeTitle.bold())
                .frame(width: 160, height: 50)
                .lineLimit(1)
                .minimumScaleFactor(0.2)
                .background(.clear, in: RoundedRectangle(cornerRadius: 7, style: .continuous))
        }
        AsyncImage(url: URL(string: "https:" + (iconString))) { image in
            image.resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
        } placeholder: {
            Circle()
                .foregroundColor(.primary)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color.blue)
                .clipShape(Rectangle())
        }
    }
}

//#Preview {
    //ForecastListLocationView(locationName: "Sydney")
//}

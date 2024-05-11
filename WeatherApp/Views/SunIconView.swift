//
//  SunIconView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct SunIconView: View {
    let title: String
    let time: String
    let icon: String
    var body: some View {
        VStack {
            Text(time)
            WeatherIconView(icon: "//cdn3.iconfinder.com/data/icons/weather-ios-11-1/50/Sunrise_Sun_Daybreak_Down_Morning_Apple_Weather-1024.png")
            Text(title)
        }
    }
}

#Preview {
    SunIconView(title: "Sunrise", time: "6:00AM", icon: "")
}

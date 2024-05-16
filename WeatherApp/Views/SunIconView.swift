//
//  SunIconView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI
private let SUN_RISE_ICON = "//cdn3.iconfinder.com/data/icons/weather-ios-11-1/50/Sunrise_Sun_Daybreak_Down_Morning_Apple_Weather-1024.png"

private let SUN_SET_ICON = "//cdn3.iconfinder.com/data/icons/weather-ios-11-1/50/Sunset_Nightfall_Sundown_Dusk_Twilight_Apple_Weather-1024.png"
struct SunIconView: View {
    let title: String
    let time: String
    let isSunRise: Bool
    var body: some View {
        VStack {
            Text(time)
            Spacer()
            WeatherIconView(icon: self.isSunRise ? SUN_RISE_ICON : SUN_SET_ICON,
                            dimensions: 50,
            chanceOfRain: 0)
            Spacer()
            Text(title)
        }
    }
}

#Preview {
    SunIconView(title: "Sunrise", time: "6:00AM", isSunRise: true)
}

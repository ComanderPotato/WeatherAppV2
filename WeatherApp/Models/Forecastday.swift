//
//  Forecastday.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import Foundation

struct Forecastday: Codable {
    let date: String
    let dateEpoch: Int
    let day: Day
    let astro: Astro
    var hour: [Hour]
    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }
}

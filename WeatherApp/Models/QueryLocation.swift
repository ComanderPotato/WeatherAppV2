//
//  QueryLocation.swift
//  WeatherApp
//
//  Created by Tom Golding on 12/5/2024.
//

import Foundation

struct QueryLocation: Codable, Hashable {
    let id: Int
    let name, region, country: String
    let lat, lon: Double
    let url: String
}

//
//  APICalls.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import Foundation


// Refactor into seperate file
enum APIRequest: String {
    case current = "current"
    case forecast = "forecast"
    case search = "search"
}
class APICalls: ObservableObject {
    init() {
    }
    func getWeatherData<T: Codable>(location: String) async throws -> T {
        return try await apiCall(request: APIRequest.current, location: location)
    }
    func searchQuery<T: Codable>(searchQuery: String) async throws -> T {
        return try await apiCall(request: APIRequest.search, location: searchQuery)
    }
}

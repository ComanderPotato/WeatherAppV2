//
//  APICall.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case bad
}
private let API_KEY = "78f67b17b64a41acbbb22331240905"

//func apiCall<T: Codable>(request: APIRequest, location: String, days: String? = "") async throws -> T {
////    let endPoint = "https://api.weatherapi.com/v1/\(request.rawValue).json?key=\(API_KEY)&q=\(location)\(days != "" ? "&days=\(days!)" : "")"
//    let endPoint = "https://api.weatherapi.com/v1/\(request.rawValue).json?key=\(API_KEY)&q=\(location)&days=10"
//    print(endPoint)
//    guard let url = URL(string: endPoint) else {
//        throw RequestError.invalidURL
//    }
//    let (data, response) = try await URLSession.shared.data(from: url)
//    
//    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//        throw RequestError.invalidResponse
//    }
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        throw RequestError.invalidData
//    }
//}

func apiCall<T: Codable>(request: APIRequest, location: String) async throws -> T {
//    let endPoint = "https://api.weatherapi.com/v1/\(request.rawValue).json?key=\(API_KEY)&q=\(location)&days=10&unixdt=\(Date().timeIntervalSince1970)"
    let endPoint = "https://api.weatherapi.com/v1/\(request.rawValue).json?key=\(API_KEY)&q=\(location)&days=10"
    print(endPoint)
    guard let url = URL(string: endPoint) else {
        throw RequestError.invalidURL
    }
    
    let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 60)
    
    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw RequestError.invalidResponse
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        throw RequestError.invalidData
    }
}
func apiCallArray(request: APIRequest, location: String) async throws -> [QueryLocation] {
    let endPoint = "https://api.weatherapi.com/v1/\(request.rawValue).json?key=\(API_KEY)&q=\(location)&unixdt=\(Date().timeIntervalSince1970)"
    guard let url = URL(string: endPoint) else {
        throw RequestError.invalidURL
    }
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw RequestError.invalidResponse
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode([QueryLocation].self, from: data)
    } catch {
        throw RequestError.invalidData
    }
}

//
//  ContentView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var weatherData: WeatherData?
    @State private var forecastData: ForecastData?
    @StateObject var viewModel = APICalls()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(weatherData?.location.country ?? "Fail")
            Text(weatherData?.location.name ?? "Fail")
            
            AsyncImage(url: URL(string: "https:" + (weatherData?.current.condition.icon ?? ""))) { image in
                
                image.resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            } placeholder: {
                Circle()
                    .foregroundColor(.primary)
            }
            
            Text(forecastData?.forecast.forecastday.first?.day.mintempC.formatted() ?? "")
            Text(forecastData?.forecast.forecastday.first?.day.maxtempC.formatted() ?? "")
        }
        .padding()
        .task {
            do {
                weatherData = try await viewModel.getWeatherData(location: "Sydney")
//                forecastData = try await viewModel.getForecastData(location: "Sydney, Ultimo", days: "5")
//
//                forecastData?.forecast.forecastday.forEach { forecastDay in
//                    print("Day: ")
//                    print(forecastDay.day.mintempC)
//                    print(forecastDay.day.maxtempC)
//                }
            } catch RequestError.invalidURL {
                print("InvalidURL")
            } catch RequestError.invalidData {
                print("InvalidData")
            } catch RequestError.invalidResponse {
                print("InvalidResponse")
            } catch RequestError.bad {
                print("BOO")
            } catch {
                print("Invalid")
            }
        }
    }

    
}

#Preview {
    ContentView()
}



//func getCurrent() async throws -> WeatherData{
//        let API_KEY = "78f67b17b64a41acbbb22331240905"
//        let endPoint = "http://api.weatherapi.com/v1/current.json?key=\(API_KEY)&q=London"
//        guard let url = URL(string: endPoint) else {
//            throw GHError.invalidURL
//        }
////        print(url)
//
//        let (data, response) = try await URLSession.shared.data(from: url)
//        print("MAkes it past")
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw GHError.invalidResponse
//        }
//        do {
//            let decoder = JSONDecoder()
////            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            return try decoder.decode(WeatherData.self, from: data)
//        } catch {
//            throw GHError.invalidData
//        }
//    }

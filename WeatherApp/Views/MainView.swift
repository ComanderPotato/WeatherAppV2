//
//  MainView.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack{
                    // search
                    MainSearchBoxView()
                    // header
                    // listview
                    Spacer()
                }
            }
        }
    }
}

/*
 if let forecast = viewModel.forecastData {
     HStack {
         ForecastListLocationView(
             locationName: forecast.location.name,
             iconString: forecast.current.condition.icon)
         Spacer()
         ForecastListTemperaturesView(
             currentDegrees: forecast.current.tempC,
             loDegrees: forecast.forecast.forecastday.first?.day.mintempC ?? 0.00,
             hiDegrees: forecast.forecast.forecastday.first?.day.maxtempC ?? 0.00)
     }
 } else {
     LoadingAnimationView()
 }
}
.padding()
.frame(width: 360)
.foregroundStyle(Color("TextColour"))
.background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 7, style: .continuous))
.task {
 do {
     try await viewModel.fetchForecast(location: inputLocation, days: "1")
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
 */


#Preview {
    MainView()
}

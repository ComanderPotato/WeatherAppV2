//
//  ForecastTemperatureBarView.swift
//  WeatherApp
//
//  Created by Tom Golding on 12/5/2024.
//

import SwiftUI

struct ForecastTemperatureBarView: View {
    let weeklyMinTemp: Int
    let weeklyMaxTemp: Int
    let currentMinTemp: Int
    let currentMaxTemp: Int
    let currentTemperature: Int
    let index: Int
    let gradient = LinearGradient( gradient: Gradient(colors: [.green, .yellow]), startPoint: .leading, endPoint: .trailing)
    let outerBarSize: CGFloat = 100
    @State var innerBarSize: CGFloat? = 0
    @State var innerBarOffset: CGFloat? = 0
    @State var ballOffset: CGFloat? = 0
    var body: some View {
       VStack {
           ZStack(alignment: .leading) {
               RoundedRectangle(cornerRadius: 5)
                   .frame(width: outerBarSize, height: 5)
                   .foregroundColor(Color.gray.opacity(0.5))
               RoundedRectangle(cornerRadius: 100)
                   .frame(width: innerBarSize, height: 5)
                   .foregroundColor(Color.clear)
                   .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(gradient)
                   )
                   .offset(x: innerBarOffset!)
               if index == 0 {
                   Circle()
                       .frame(width: 5)
                       .foregroundStyle(.white)
                       .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                       .offset(x: ballOffset!)
               }
           }
       
       }.onAppear {
           let weeklyDiff = weeklyMaxTemp - weeklyMinTemp
           let currentDiff = currentMaxTemp - currentMinTemp
           if currentMinTemp != weeklyMinTemp {
               innerBarOffset = CGFloat((Int(self.outerBarSize) / weeklyDiff) * (currentMinTemp - weeklyMinTemp))
           }
           if index == 0 {
               ballOffset = CGFloat((Int(self.outerBarSize) / weeklyDiff) * (currentTemperature - weeklyMinTemp))
           }
           innerBarSize = CGFloat((Int(self.outerBarSize) / weeklyDiff) * currentDiff)
       }
    }
}

#Preview {
    ForecastTemperatureBarView(
        weeklyMinTemp: 3,
        weeklyMaxTemp: 15,
        currentMinTemp: 7,
        currentMaxTemp: 14,
        currentTemperature: 15,
        index: 0
    )
}

//
//  MainHeaderView.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import SwiftUI

struct MainHeaderView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        /*
         HStack {
             if locationLoaded {
                 Text(currentLocation)
                     .font(.system(size: 36, weight: .bold, design: .rounded))
                     .padding()
                     .frame(width: 360)
                     .foregroundStyle(LinearGradient(colors: [.white, .white], startPoint: .top, endPoint: .bottom)) // experimenting
                     .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 7, style: .continuous))
             }
             else {
                 Text("Welcome")
                     .font(.system(size: 36, weight: .bold, design: .rounded))
                     .padding()
                     .frame(width: 360)
                     .foregroundStyle(LinearGradient(colors: [.white, .white], startPoint: .top, endPoint: .bottom)) // experimenting
                     .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 7, style: .continuous))
             }
         }
         .padding()
         */
    }
}

#Preview {
    MainHeaderView()
}

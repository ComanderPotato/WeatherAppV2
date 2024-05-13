//
//  WidgetView.swift
//  WeatherApp
//
//  Created by Tom Golding on 13/5/2024.
//

import SwiftUI

struct WidgetView: View {
    let icon: String
    let title: String
    let info: String
    let description: String
    var body: some View {
            VStack {
                HStack {
                    Image(systemName: icon)
                    Text(title)
                    Spacer()
                }
                
                HStack {
                    Text(info)
                    Spacer()
                }
                Spacer()
                HStack {
                    Text(description)
                    Spacer()
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.thickMaterial))
//            .frame(height: geometry.size.width)
    }
}

#Preview {
    WidgetView(icon: "clock", title: "Widget", info: "Stuff", description: "Similar to the actual temperature")
}

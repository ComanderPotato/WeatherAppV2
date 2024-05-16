//
//  HeaderIcon.swift
//  WeatherApp
//
//  Created by Tom Golding on 17/5/2024.
//

import SwiftUI

struct HeaderIcon: View {
    let icon: String
    var body: some View {
        Image(systemName: icon)
            .foregroundColor(Color.black.opacity(0.5))
            .frame(width: 5, height: 5)
            .padding(.trailing, 10)
    }
}

#Preview {
    HeaderIcon(icon: "clock")
}

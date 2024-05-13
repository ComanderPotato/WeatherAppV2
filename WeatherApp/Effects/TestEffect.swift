//
//  testView.swift
//  WeatherApp
//
//  Created by Leonna Myers on 14/5/2024.
//

import SwiftUI

struct TestEffect: View {
@State var fileName: String
    var body: some View {
        SpriteKitView(fileName: fileName)
                    .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    TestEffect(fileName: "Rain")
}

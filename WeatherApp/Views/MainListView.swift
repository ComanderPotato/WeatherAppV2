//
//  MainListView.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import SwiftUI

struct MainListView: View {
    @StateObject var dataSavingManager = DataSavingManager()
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(dataSavingManager.getSortedSavedDataList(), id: \.self) { item in
                ForecastListView(inputLocation: item)
            }
        }
        Spacer()
    }
}

#Preview {
    MainListView()
}

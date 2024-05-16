//
//  MainListView.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State var hasFirst: Bool = false
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                ForEach(Array(mainViewModel.savedData.enumerated()), id: \.element) { index, item in
                    MainListItemView(location: item, isCurrentLocation: hasFirst && index == 0).environmentObject(mainViewModel)
                }
                Spacer()
            }
        }.onAppear {
            hasFirst = mainViewModel.locationAuthorizationStatus != .notDetermined
        }
    }
}

#Preview {
    MainListView().environmentObject(MainViewModel())
}

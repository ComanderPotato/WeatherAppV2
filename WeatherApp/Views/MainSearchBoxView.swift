//
//  MainSearchBoxView.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import SwiftUI

struct MainSearchBoxView: View {
    @StateObject var viewModel = MainSearchBoxViewModel()
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.trailing, 8)

            UITextFieldWrapper(text: $viewModel.searchQuery)
                .padding()
                .disableAutocorrection(true)
                .autocorrectionDisabled()
                .autocapitalization(/*@START_MENU_TOKEN@*/ .none/*@END_MENU_TOKEN@*/)
                .frame(width: 200, height: 30)

            Spacer()
        }
        .padding()
        .frame(width: 360)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 7, style: .continuous))
    }
}

#Preview {
    MainSearchBoxView()
}

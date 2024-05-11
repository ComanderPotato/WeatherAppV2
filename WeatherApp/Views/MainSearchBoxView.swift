//
//  MainSearchBoxView.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import SwiftUI

struct MainSearchBoxView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MainSearchBoxView()
}

/*
 VStack {
     // search locations box
     NavigationLink {
         MainSearchView()
     } label: {
         HStack(alignment: .firstTextBaseline) {
             Image(systemName: "magnifyingglass")
                 .foregroundColor(.white)
                 .padding(.trailing, 8)
             UITextFieldWrapper(text: $searchQuery)
                 .padding()
                 .onTapGesture {}
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
     .padding()
 }
}

 */

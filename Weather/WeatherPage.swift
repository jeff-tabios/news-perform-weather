//
//  WeatherPage.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/13/23.
//

import SwiftUI

struct WeatherPage: View {

    @State var selectedButton: SortOptions = .aToZ

    var body: some View {
        VStack {
            WeatherOptions(selectedButton: $selectedButton)
            WeatherList()
            Divider()
            Button {

            } label: {
                Text("Filter")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color("TextColor"))
            }
            .padding(.top, 10)
            .buttonStyle(.borderless)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Weather")
    }
}

struct WeatherPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeatherPage()
        }
    }
}

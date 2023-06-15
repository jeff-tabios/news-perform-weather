//
//  WeatherPage.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/13/23.
//

import SwiftUI

struct WeatherPage: View {
    @StateObject var vm = WeatherPageViewModel()
    @State var selectedTab: SortOptions = .aToZ
    @State private var showingFilter = false

    var body: some View {
        VStack {
            WeatherOptions(selectedTab: $selectedTab, vm: vm)
            WeatherList(selectedTab: $selectedTab, vm: vm)
            Divider()
            Button {
                showingFilter.toggle()
            } label: {
                Text("Filter")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color("TextColor"))
            }
            .sheet(isPresented: $showingFilter) {
                CountryList()
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
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

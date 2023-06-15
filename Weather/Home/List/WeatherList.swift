//
//  WeatherList.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/13/23.
//

import SwiftUI

struct WeatherList: View {
    @Binding var selectedTab: SortOptions
    @ObservedObject var vm: WeatherPageViewModel

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                ScrollingList(list: vm.weatherDataSortedByAToZ)
                    .tag(SortOptions.aToZ)
                ScrollingList(list: vm.weatherDataSortedByTemp)
                    .tag(SortOptions.temperature)
                ScrollingList(list: vm.weatherDataSortedByLastUpdate)
                    .tag(SortOptions.lastUpdated)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
        }
    }
}

struct ScrollingList: View {
    var list: [WeatherData]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(list, id: \.self) { weather in
                    WeatherListItem(weather: weather)
                }
            }
        }
    }
}

struct WeatherList_Previews: PreviewProvider {
    static var previews: some View {
        WeatherList(selectedTab: .constant(.aToZ),
                    vm: WeatherPageViewModel())
    }
}

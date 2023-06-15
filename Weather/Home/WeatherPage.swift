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

    var body: some View {
        VStack {
            if vm.isRefreshing {
                Text("Loading...")
                    .foregroundColor(Color("GreenColor"))
                    .font(.title3)

            } else {
                WeatherOptions(selectedTab: $selectedTab, vm: vm)
                WeatherList(selectedTab: $selectedTab, vm: vm)
                Divider()
                FilterButton(vm: vm)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    vm.refreshData()
                } label: {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                }
                .disabled(vm.isRefreshing ? true : false)
            }
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

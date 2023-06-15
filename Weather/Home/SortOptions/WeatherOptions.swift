//
//  WeatherOptions.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/13/23.
//

import SwiftUI

enum SortOptions: Int {
    case aToZ, temperature, lastUpdated
}

struct SortOption: View {
    var title: String
    var isSelected: Bool
    var action: ()->Void

    var body: some View {
        VStack {
            Button(action: action) {
                Text(title)
                    .foregroundColor(Color("TextColor"))
                    .fontWeight(isSelected ? .bold : .regular)
                    .font(.title3)
                    .padding(.horizontal, 5)
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    .frame(maxWidth: .infinity)
                    .overlay(Rectangle()
                        .frame(height: isSelected ? 3 : 0,alignment: .bottom)
                        .foregroundColor(Color("TealColor")),
                             alignment: .bottom)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct WeatherOptions: View {
    @Binding var selectedTab: SortOptions
    @ObservedObject var vm: WeatherPageViewModel

    var body: some View {
        ZStack {
            HStack(alignment: .bottom) {
                Rectangle()
                    .frame(width: nil, height: 1)
                    .foregroundColor(Color("LineColor"))
                    .padding(.top, 50)
            }

            HStack {
                SortOption(title: "A-Z", isSelected: selectedTab == .aToZ) {
                    selectedTab = .aToZ
                }
                .frame(width: 60)
                SortOption(title: "Temperature", isSelected: selectedTab == .temperature) {
                    selectedTab = .temperature
                }
                .frame(width: 140)
                SortOption(title: "Last Updated", isSelected: selectedTab == .lastUpdated) {
                    selectedTab = .lastUpdated
                }
                .frame(width: 140)
                Spacer()
            }
            .padding(.leading, 10)
        }
    }
}

struct WeatherOptions_Previews: PreviewProvider {
    static var previews: some View {
        WeatherOptions(selectedTab: .constant(.aToZ),
                       vm: WeatherPageViewModel())
        .border(.green)
    }
}

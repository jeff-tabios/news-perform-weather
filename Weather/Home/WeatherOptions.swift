//
//  WeatherOptions.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/13/23.
//

import SwiftUI

enum SortOptions {
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
    @Binding var selectedButton: SortOptions

    var body: some View {
        ZStack {
            HStack(alignment: .bottom) {
                Rectangle()
                    .frame(width: nil, height: 1)
                    .foregroundColor(Color("LineColor"))
                    .padding(.top, 50)
            }

            HStack {
                SortOption(title: "A-Z", isSelected: selectedButton == .aToZ) {
                    selectedButton = .aToZ
                }
                .frame(width: 60)
                SortOption(title: "Temperature", isSelected: selectedButton == .temperature) {
                    selectedButton = .temperature
                }
                .frame(width: 140)
                SortOption(title: "Last Updated", isSelected: selectedButton == .lastUpdated) {
                    selectedButton = .lastUpdated
                }
                .frame(width: 140)
                Spacer()
            }
            .padding(.leading, 10)
            .animation(.easeInOut(duration: 0.2), value: selectedButton)
        }
    }
}

struct WeatherOptions_Previews: PreviewProvider {
    static var previews: some View {
        WeatherOptions(selectedButton: .constant(.aToZ))
            .border(.green)
    }
}

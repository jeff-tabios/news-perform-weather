//
//  CountryItem.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/15/23.
//

import SwiftUI

struct CountryItem: View {
    @ObservedObject var vm: WeatherPageViewModel
    @Binding var showingFilter: Bool

    var name: String

    var body: some View {
        Button {
            showingFilter = false
            vm.setFilter(filter: name)
        } label: {
            VStack {
                HStack {
                    Text(name)
                        .foregroundColor(Color("TextColor"))
                        .font(.title2)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("TealColor"))
                        .imageScale(.large)
                }
                .padding()
                Divider()
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

struct CountryItem_Previews: PreviewProvider {
    static var previews: some View {
        CountryItem(vm: WeatherPageViewModel(), showingFilter: .constant(true), name: "Adelaide")
    }
}

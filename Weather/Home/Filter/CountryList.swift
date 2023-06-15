//
//  CountryList.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/14/23.
//

import SwiftUI

struct CountryListHeader: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 60)
                .foregroundColor(Color("GreenColor"))
            Text("Countries")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.title3)
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .imageScale(.large)
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct CountryList: View {
    @ObservedObject var vm: WeatherPageViewModel
    @Binding var showingFilter: Bool

    var body: some View {
        VStack {
            CountryListHeader()
            ScrollView {
                VStack {
                    ForEach(vm.countries, id: \.self) { country in
                        VStack(alignment: .leading) {
                            CountryItem(vm: vm, showingFilter: $showingFilter, name: country)
                        }
                    }
                }
            }
        }
    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList(vm: WeatherPageViewModel(), showingFilter: .constant(true))
    }
}

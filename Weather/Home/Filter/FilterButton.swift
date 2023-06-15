//
//  FilterButton.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/15/23.
//

import SwiftUI

struct FilterButton: View {
    @ObservedObject var vm = WeatherPageViewModel()
    @State private var showingFilter = false
    
    var body: some View {
        Button {
            showingFilter.toggle()
        } label: {
            Text("Filter")
                .font(.title3)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color("TextColor"))
        }
        .sheet(isPresented: $showingFilter) {
            CountryList(vm: vm, showingFilter: $showingFilter)
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
        .buttonStyle(.borderless)
    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterButton(vm: WeatherPageViewModel())
    }
}

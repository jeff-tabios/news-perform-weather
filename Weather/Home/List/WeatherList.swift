//
//  WeatherList.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/13/23.
//

import SwiftUI

struct WeatherList: View {

    var body: some View {
        ScrollView {
            WeatherListItem()
            WeatherListItem()
            WeatherListItem()
            WeatherListItem()
            WeatherListItem()
            WeatherListItem()
            WeatherListItem()
            WeatherListItem()
            WeatherListItem()
            WeatherListItem()
        }
        .scrollIndicators(.hidden)
    }
}

struct WeatherList_Previews: PreviewProvider {
    static var previews: some View {
        WeatherList()
    }
}

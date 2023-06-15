//
//  WeatherDetail.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/14/23.
//

import SwiftUI

struct WeatherDetail: View {
    var weather: WeatherData

    var body: some View {
        VStack {
            WeatherListItem(weather: weather)
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("Feels Like")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(weather.weatherFeelsLike ?? "")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("TealColor"))
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Humidity")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(weather.weatherHumidity?.replacingOccurrences(of: "Humidity: ", with: "") ?? "")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("TealColor"))
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Wind")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(weather.weatherWind?.replacingOccurrences(of: "Wind: ", with: "") ?? "")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("TealColor"))
                }
                Spacer()
            }
            Divider()
            Text("Last Updated 9:00am 01 December 2017")
                .foregroundColor(Color("TextColor"))
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Detail")
    }
}

struct WeatherDetail_Previews: PreviewProvider {
    static var previews: some View {
        let mockData = WeatherData(venueID: "97",
                                   name: "Adelaide River",
                                   country: Country(countryID: "16", name: "Australia"),
                                   weatherCondition: "Partly Cloudy",
                                   weatherWind: "Wind: ESE at 17kph",
                                   weatherHumidity: "Humidity: 65%",
                                   weatherTemp: "27",
                                   weatherFeelsLike: "34",
                                   weatherLastUpdated: 1401666605)
        NavigationView {
            WeatherDetail(weather: mockData)
        }
    }
}

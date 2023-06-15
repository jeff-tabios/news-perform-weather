//
//  WeatherListItem.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/14/23.
//

import SwiftUI

struct WeatherListItem: View {
    @State var isTapped: Bool = false
    var weather: WeatherData

    var body: some View {
        VStack {
            NavigationLink(destination: WeatherDetail(weather: weather), isActive: $isTapped) {
                EmptyView()
            }
            Button {
                isTapped = true
            } label: {
                HStack {
                    VStack(alignment: .leading) {
                        Text(weather.name)
                            .foregroundColor(Color("TextColor"))
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(weather.weatherCondition ?? "")
                            .foregroundColor(Color("TextColor"))
                            .font(.title3)
                        Text(weather.datePretty())
                            .foregroundColor(Color("TextColor"))
                            .font(.subheadline)
                    }
                    .padding()
                    Spacer()
                    Text("\(weather.weatherTemp ?? "")°")
                        .foregroundColor(Color("TealColor"))
                        .fontWeight(.bold)
                        .font(.system(size: 54))
                }
            }
            .padding()
            Divider()
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)

    }
}

struct WeatherListItem_Previews: PreviewProvider {
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

        WeatherListItem(weather: mockData)
            .border(.red)
    }
}

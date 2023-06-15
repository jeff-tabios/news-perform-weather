//
//  Weather.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/14/23.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let ret, isOkay: Bool
    let data: [WeatherData]
}

/*
 {
     "_venueID": "97",
     "_name": "Adelaide River",
     "_country": {
         "_countryID": "16",
         "_name": "Australia"
     },
     "_weatherCondition": "Partly Cloudy",
     "_weatherConditionIcon": "partlycloudy",
     "_weatherWind": "Wind: ESE at 17kph",
     "_weatherHumidity": "Humidity: 65%",
     "_weatherTemp": "27",
     "_weatherFeelsLike": "34",
     "_sport": {
         "_sportID": "1",
         "_description": "Horse Racing"
     },
     "_weatherLastUpdated": 1401666605
 },
 */

// MARK: - WeatherData
struct WeatherData: Codable, Hashable {
    var identifier: String {
        return UUID().uuidString
    }

    let venueID, name: String
    let country: Country
    let weatherCondition: String?
    let weatherWind, weatherHumidity, weatherTemp, weatherFeelsLike: String?
    let weatherLastUpdated: Int?

    enum CodingKeys: String, CodingKey {
        case venueID = "_venueID"
        case name = "_name"
        case country = "_country"
        case weatherCondition = "_weatherCondition"
        case weatherWind = "_weatherWind"
        case weatherHumidity = "_weatherHumidity"
        case weatherTemp = "_weatherTemp"
        case weatherFeelsLike = "_weatherFeelsLike"
        case weatherLastUpdated = "_weatherLastUpdated"
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }

    static func == (lhs: WeatherData, rhs: WeatherData) -> Bool {
        lhs.identifier == rhs.identifier
    }
}

// MARK: - Country
struct Country: Codable {
    let countryID: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case countryID = "_countryID"
        case name = "_name"
    }
}

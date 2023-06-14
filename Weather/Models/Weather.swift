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
struct WeatherData: Codable {
    let venueID, name: String
    let country: Country
    let weatherCondition: String?
    let weatherConditionIcon: WeatherConditionIcon?
    let weatherWind, weatherHumidity, weatherTemp, weatherFeelsLike: String?
    let sport: Sport
    let weatherLastUpdated: Int?

    enum CodingKeys: String, CodingKey {
        case venueID = "_venueID"
        case name = "_name"
        case country = "_country"
        case weatherCondition = "_weatherCondition"
        case weatherConditionIcon = "_weatherConditionIcon"
        case weatherWind = "_weatherWind"
        case weatherHumidity = "_weatherHumidity"
        case weatherTemp = "_weatherTemp"
        case weatherFeelsLike = "_weatherFeelsLike"
        case sport = "_sport"
        case weatherLastUpdated = "_weatherLastUpdated"
    }
}

// MARK: - Country
struct Country: Codable {
    let countryID: String
    let name: Name

    enum CodingKeys: String, CodingKey {
        case countryID = "_countryID"
        case name = "_name"
    }
}

enum Name: String, Codable {
    case australia = "Australia"
    case hongKong = "Hong Kong"
    case ireland = "Ireland"
    case newZealand = "New Zealand"
    case singapore = "Singapore"
    case unitedKingdom = "United Kingdom"
}

// MARK: - Sport
struct Sport: Codable {
    let sportID: String
    let description: Description

    enum CodingKeys: String, CodingKey {
        case sportID = "_sportID"
        case description = "_description"
    }
}

enum Description: String, Codable {
    case horseRacing = "Horse Racing"
}

enum WeatherConditionIcon: String, Codable {
    case clear = "clear"
    case cloudy = "cloudy"
    case fog = "fog"
    case hazy = "hazy"
    case mostlycloudy = "mostlycloudy"
    case partlycloudy = "partlycloudy"
    case rain = "rain"
    case snow = "snow"
    case tstorms = "tstorms"
}

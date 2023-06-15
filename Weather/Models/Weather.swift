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

    func datePretty() -> String {
        guard let lastUpdate = weatherLastUpdated else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mma dd MMM yyyy"
        let date = Date(timeIntervalSince1970: TimeInterval(lastUpdate))
        return dateFormatter.string(from: date)
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

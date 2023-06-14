//
//  MockService.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/15/23.
//

import Foundation
import Combine

final class MockService: NetworkServiceProtocol {
    var mockWeatherData: [WeatherData]
    var mockData: Weather

    init() {
        mockWeatherData = [
            WeatherData(venueID: "97",
                        name: "Adelaide River",
                        country: Country(countryID: "16", name: "Australia"),
                        weatherCondition: "Partly Cloudy",
                        weatherWind: "Wind: ESE at 17kph",
                        weatherHumidity: "Humidity: 65%",
                        weatherTemp: "27",
                        weatherFeelsLike: "34",
                        weatherLastUpdated: 1401666605)
        ]
        mockData = Weather(ret: true, isOkay: true, data: mockWeatherData)
    }

    func loadData<T>(url: URL) throws -> AnyPublisher<T, Error> where T : Decodable {
        return Just(mockData as! T)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

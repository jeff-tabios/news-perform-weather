//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Jeffrey Tabios on 6/13/23.
//

import XCTest
import Combine
@testable import Weather

final class WeatherTests: XCTestCase {
    
    func test_Get_Weather_Data_Should_Get_Data() {
        let provider = WeatherProvider(service: MockService())
        let sut = WeatherPageViewModel(provider: provider)
        var cancellables = Set<AnyCancellable>()

        let exp = expectation(description: "Loading weather data")

        provider.weatherData
            .sink { (completion) in
                print(completion)
            } receiveValue: { data in
                if !data.isEmpty {
                    print(data)
                    exp.fulfill()
                }
            }
            .store(in: &cancellables)

        sut.refreshData()

        wait(for: [exp], timeout: 3)

        XCTAssertEqual(provider.weatherData.value.count, 1)
    }
}

//
//  WeatherManager.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/14/23.
//

import Foundation
import Combine

protocol WeatherProviderProtocol {
    var weatherData: CurrentValueSubject<[WeatherData], Error> { get }
    func getWeatherData()
}

final class WeatherProvider: WeatherProviderProtocol {
    private let weatherUrl = "https://dnu5embx6omws.cloudfront.net/venues/weather.json"
    private let service: NetworkServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    //Data
    let weatherData = CurrentValueSubject<[WeatherData], Error>([])

    init(service: NetworkServiceProtocol = NetworkService()) {
        self.service = service
    }

    func getWeatherData() {
        guard let url = URL(string: weatherUrl) else {return}

        do {
            let weatherData: AnyPublisher<Weather, Error> = try service.loadData(url: url)
            weatherData
                .map(\.data)
                .sink { (completion) in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                } receiveValue: { [weak self] weather in
                    self?.weatherData.send(weather.filter { $0.weatherTemp != nil })
                }
                .store(in: &cancellables)
        } catch {
            print(error)
        }
    }
}

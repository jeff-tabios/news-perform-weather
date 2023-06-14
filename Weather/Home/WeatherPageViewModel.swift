//
//  WeatherPageViewModel.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/14/23.
//

import Foundation
import Combine

final class WeatherPageViewModel: ObservableObject {
    @Published var isRefreshed = false

    private let provider: WeatherProviderProtocol
    private var cancellables = Set<AnyCancellable>()

    private(set) var weatherData: [WeatherData] = []

    var aToZSorted: [WeatherData] {
        weatherData.sorted {
            $0.name < $1.name
        }
    }

    var tempSorted: [WeatherData] {
        weatherData.sorted {
            guard let first = $0.weatherTemp,
                    let second = $1.weatherTemp else { return false }
            return first < second
        }
    }

    var lastUpdateSorted: [WeatherData] {
        weatherData.sorted {
            guard let first = $0.weatherLastUpdated,
                    let second = $1.weatherLastUpdated else { return false }
            return first < second
        }
    }

    init(provider: WeatherProviderProtocol = WeatherProvider()) {
        self.provider = provider
        addSubscriptions()
        refreshData()
    }

    func refreshData() {
        provider.getWeatherData()
    }

    func addSubscriptions() {
        provider.weatherData
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] data in
                if !data.isEmpty {
                    self?.weatherData = data
                    self?.processWeatherData()
                }
            }
            .store(in: &cancellables)
    }

    func processWeatherData() {

    }
}

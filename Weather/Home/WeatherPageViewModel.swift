//
//  WeatherPageViewModel.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/14/23.
//

import Foundation
import Combine

final class WeatherPageViewModel: ObservableObject {
    @Published var isRefreshing = true
    private(set) var filter: String = ""

    private let provider: WeatherProviderProtocol
    private var cancellables = Set<AnyCancellable>()

    private(set) var weatherData: [WeatherData] = []
    private(set) var weatherDataSortedByAToZ: [WeatherData] = []
    private(set) var weatherDataSortedByTemp: [WeatherData] = []
    private(set) var weatherDataSortedByLastUpdate: [WeatherData] = []

    init(provider: WeatherProviderProtocol = WeatherProvider()) {
        self.provider = provider
        addSubscriptions()
        refreshData()
    }

    func refreshData() {
        isRefreshing = true
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
                    self?.preSortData()
                    self?.isRefreshing = false
                }
            }
            .store(in: &cancellables)
    }

    private func preSortData() {
        weatherDataSortedByAToZ = weatherData.sorted {
            $0.name < $1.name
        }

        weatherDataSortedByTemp = weatherData.sorted {
            guard let first = $0.weatherTemp,
                    let second = $1.weatherTemp else { return false }
            return first < second
        }

        weatherDataSortedByLastUpdate = weatherData.sorted {
            guard let first = $0.weatherLastUpdated,
                    let second = $1.weatherLastUpdated else { return false }
            return first < second
        }
    }
}

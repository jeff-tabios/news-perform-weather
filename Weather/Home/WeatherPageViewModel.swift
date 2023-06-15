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
    var countries: [String] = []

    init(provider: WeatherProviderProtocol = WeatherProvider()) {
        self.provider = provider
        addSubscriptions()
        refreshData()
    }

    func setFilter(filter: String = "") {
        self.filter = filter
        configureData()
    }

    func refreshData() {
        isRefreshing = true
        self.filter = ""
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
                    self?.configureData()
                }
            }
            .store(in: &cancellables)
    }

    private func configureData() {
        weatherDataSortedByAToZ = weatherData.sorted {
            $0.name < $1.name
        }.filter { !filter.isEmpty ? $0.country.name == filter : true }

        weatherDataSortedByTemp = weatherData.sorted {
            guard let first = $0.weatherTemp,
                    let second = $1.weatherTemp else { return false }
            return first < second
        }.filter { !filter.isEmpty ? $0.country.name == filter : true }

        weatherDataSortedByLastUpdate = weatherData.sorted {
            guard let first = $0.weatherLastUpdated,
                    let second = $1.weatherLastUpdated else { return false }
            return first > second
        }.filter { !filter.isEmpty ? $0.country.name == filter : true }

        countries = Array(Set(weatherData.map { $0.country.name })).sorted{ $0 < $1 }

        isRefreshing = false
    }
}

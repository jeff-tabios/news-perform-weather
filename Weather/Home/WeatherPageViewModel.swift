//
//  WeatherPageViewModel.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/14/23.
//

import Foundation
import Combine

final class WeatherPageViewModel: ObservableObject {
    let provider: WeatherProviderProtocol

    init(provider: WeatherProviderProtocol = WeatherProvider()) {
        self.provider = provider
    }

    func refreshData() {
        do {
            try provider.getWeatherData()
            print("success")
        } catch {
            print(error)
        }
    }
}

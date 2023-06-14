//
//  WeatherPageViewModel.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/14/23.
//

import Foundation
import Combine

final class WeatherPageViewModel: ObservableObject {
    let manager: WeatherManagerProtocol

    init(manager: WeatherManagerProtocol = WeatherManager()) {
        self.manager = manager
    }

    func refreshData() {

    }
}

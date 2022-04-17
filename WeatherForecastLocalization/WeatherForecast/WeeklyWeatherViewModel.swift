//
//  WeeklyWeatherViewModel.swift
//  WeatherForecast
//
//  Created by A on 4/10/22.
//

import SwiftUI
import Combine

class WeeklyWeatherViewModel: ObservableObject {
    @Published var weather: WeeklyWeather?
    init() {
        self.fetch()
    }
}

extension WeeklyWeatherViewModel {
    func fetch(by city: String = "Minsk") {
        API.weeklyWeather(city) {
            self.weather = $0
        }
    }
}

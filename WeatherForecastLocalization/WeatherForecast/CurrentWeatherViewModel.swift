//
//  CurrentWeather.swift
//  WeatherForecast
//
//  Created by A on 4/10/22.
//

import SwiftUI
import Combine

final class CurrentWeatherViewModel: ObservableObject {
    @Published var current: Weather?
    
    init() {
        self.fetch()
    }
}

extension CurrentWeatherViewModel {
    func fetch(_ city:String = "Minsk"){
        API.fetchCurrentWeather(by: city) {
            self.current = $0
        }
    }
}

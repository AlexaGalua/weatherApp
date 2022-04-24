
//
//  IconView.swift
//  WeatherForecast
//
//  Created by А on 4/12/22.
//

import SwiftUI
import Combine

struct IconView: View {
//    @Environment(\.colorScheme) var colorScheme
    var icon: String?
    
    var body: some View {
        Image(systemName: weatherIcons[icon ?? "loading"] ?? "goforward")
    }
    let weatherIcons = [
        "01d": "sun.max",
        "02d": "cloud.sun",
        "03d": "cloud",
        "04d": "smoke",
        "09d": "cloud.drizzle",
        "10d": "cloud.rain",
        "11d": "cloud.bolt.rain",
        "13d": "snow",
        "50d": "cloud.fog",
        "01n": "moon.stars",
        "02n": "cloud.moon",
        "03n": "cloud",
        "04n": "smoke",
        "09n": "cloud.drizzle",
        "10n": "cloud.rain",
        "11n": "cloud.bolt.rain",
        "13n": "snow",
        "50n": "cloud.fog",
        "loading" : "goforward",
        "wind" : "wind",
        "sunrise" : "sunrise",
        "sunset" : "sunset",
        "humidity" : "humidity",
        "magnifyingglass" : "magnifyingglass.circle",
        "thermometer" : "thermometer.sun"
    ]
}

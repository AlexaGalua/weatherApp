//
//  WeeklyWeather.swift
//  WeatherForecast
//
//  Created by A on 4/10/22.
//

import Foundation

struct WeeklyWeather: Codable {
    let list: [ListData]
    let city: CityObject
}

struct ListData: Codable, Identifiable {
    let id = UUID()
    let dt: Int
    let main: TempObject
    let weather: [WeatherObject]
    let clouds: CloudObject
}


struct TempObject: Codable {
    let temp, tempMin, tempMax: Double
    let pressure, humidity: Int
}


struct WeatherObject: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}


struct CloudObject: Codable {
    let all: Double
}


struct CityObject: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let timezone: Int
    let population: Int
}

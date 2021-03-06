//
//  API.swift
//  WeatherForecast
//
//  Created by А on 4/9/22.
//

import Foundation

private let baseUrlforCurrentWeather = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
private let appid = "e56577d8f032bc31ab1e10d0bb3f513e"
private let baseUrlForWeeklyWeather = URL(string: "https://api.openweathermap.org/data/2.5/forecast")!
private var decoder: JSONDecoder {
    let decode = JSONDecoder()
    decode.keyDecodingStrategy = .convertFromSnakeCase
    return decode
}

import SwiftUI

class API {
    class func fetchCurrentWeather(by city: String, onSuccess: @escaping (Weather) -> Void ){
        let query = ["q": "\(city)", "appid": appid, "units": "metric"]
        guard let url = baseUrlforCurrentWeather.withQueries(query) else { fatalError() }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data, err == nil else { fatalError(err!.localizedDescription) }
            do {
                let weather = try decoder.decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(weather)
                }
            } catch {
                  fatalError(error.localizedDescription)
            }
        }.resume()
    }

    class func weeklyWeather(_ city: String, onSuccess: @escaping (WeeklyWeather) -> Void) {
        let query = ["q": "\(city)", "appid": appid, "units": "metric", "cnt": "15"]
        guard let url = baseUrlForWeeklyWeather.withQueries(query) else { fatalError() }
        URLSession.shared.dataTask(with: url) { data, res, err in
            guard let data = data, err == nil else {
                fatalError(err!.localizedDescription)
            }
            do {
                let weather = try decoder.decode(WeeklyWeather.self, from:data)
                DispatchQueue.main.async {
                    onSuccess(weather)
                }
            } catch {
                  fatalError(error.localizedDescription)
            }
        }.resume()
    }
}

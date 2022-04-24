//
//  ContentView.swift
//  WeatherForecast
//
//  Created by А on 4/9/22.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var weather = CurrentWeatherViewModel()
    @ObservedObject var weeklyWeather = WeeklyWeatherViewModel()
    @State var city: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter your city".localizated (), text: $city, onCommit: {
                self.weather.fetch(self.city)
                self.weeklyWeather.fetch(by: self.city)
            })
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1)))
            HStack {
                CurrentWeather(weather: self.weather.current)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            HStack {
                WeeklyWeatherView(listData: weeklyWeather.weather?.list ?? [])
            }
            .frame(width: UIScreen.main.bounds.width, height: 120)
        }
    }
}



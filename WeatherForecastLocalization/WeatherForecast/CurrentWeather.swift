//
//  CurrentWeather.swift
//  WeatherForecast
//
//  Created by А on 4/10/22.
//

import SwiftUI

struct CurrentWeather: View  {
    var weather: Weather?

    var body: some View {
        VStack (alignment: .center, spacing: 10) {
            Text("\(weather?.name ?? "Unkown")".localizated ())
                .foregroundColor(.black)
                .fontWeight(.light)
                .font(.system(size: 50))
            IconView (icon: weather?.weather.last?.icon)
                .font(.system(size: 40, weight: .black))
                .foregroundColor(Color.black)
            HStack {
                Text("\(weather?.main.temp.round ?? 0)ºC")
                    .foregroundColor(.black)
                    .fontWeight(.ultraLight)
                    .font(.system(size: 70))
            }
            HStack {
                Text("\(weather?.weather.last?.description ?? "Unknown")".localizated ())
                    .foregroundColor(.black)
                    .font(.custom("Helvetica Neue", size: 20))
            }
            HStack {
                IconView(icon: "humidity").foregroundColor(.blue);
                Text("\(weather?.main.humidity ?? 0) %")
                    .foregroundColor(.black)
                    .font(.custom("Helvetica Neue", size: 20))
            }
            HStack {
                IconView(icon: "wind")
                    .foregroundColor(.blue);
                Text("\(weather?.wind.speed ?? 0) m/s" .localizated ())
                    .foregroundColor(.black)
                    .font(.custom("Helvetica Neue", size: 20))
                
            }
        }
    }
}

//
//  CurrentWeather.swift
//  WeatherForecast
//
//  Created by A on 4/10/22.
//

import SwiftUI

struct CurrentWeather: View  {
    var weather: Weather?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
       
    var body: some View {
        VStack (alignment: .center, spacing: 20) {
            Text("\(weather?.name ?? "Unkown")".localizated ())
                .font(.title)
                .foregroundColor(.white)
                .bold()
            IconView (icon: weather?.weather.last?.icon, size: .large)
            HStack{
            Text("\(weather?.main.temp.round ?? 0)ºC")
                .foregroundColor(.white)
                .fontWeight(Font.Weight.heavy)
                .font(.system(size: 65))
            }
            HStack{
            Text("\(weather?.weather.last?.description ?? "Unknown")".localizated ())
                .foregroundColor(.white)
                .font(.body)
            }
            HStack{
            IconView(icon: "humidity", size: .small);
            Text("\(weather?.main.humidity ?? 0) %")
                .foregroundColor(.white)
                .font(.body)
            }
            HStack{
            IconView(icon: "wind", size: .small);
            Text("\(weather?.wind.speed ?? 0)" + " m/s".localizated ())
                .foregroundColor(.white)
                .font(.body)
            }
        }.frame(width: width, height: height)
         .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

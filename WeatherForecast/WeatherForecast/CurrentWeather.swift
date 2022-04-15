//
//  CurrentWeather.swift
//  WeatherForecast
//
//  Created by 1 on 4/10/22.
//

import SwiftUI

struct CurrentWeather: View  {
    var weather: Weather?

    var height: CGFloat = 0
       
    var body: some View {
        VStack (alignment: .center, spacing: 20) {
            Text("\(weather?.name ?? "Unkown")")
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
//            Text("\(weather?.weather.last?.description ?? "Unkown")")
//                .foregroundColor(.white)
//                .font(.body)
            
            IconView(icon: "humidity", size: .small);
            Text("\(weather?.main.humidity ?? 0)%")
                .foregroundColor(.white)
                .font(.body)
            }
            
        }.frame(width: UIScreen.main.bounds.width, height: height)
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

//
//  CardView.swift
//  WeatherForecast
//
//  Created by А on 4/10/22.
//

import SwiftUI

struct CardView: View {
    var list: ListData

    var body: some View {
        VStack (spacing: 5) {
            Text(dayOfTheWeekFromTimestamp(list.dt.timestamp))
                .foregroundColor(.black)
                .font(.system(size: 15))
            Spacer()
            IconView (icon: list.weather.last?.icon)
                .font(.system(size: 20, weight: .ultraLight))
                .font(.body)
                .foregroundColor(.black)
            HStack{
                IconView(icon: "thermometer")
                    .font(.system(size: 16, weight: .ultraLight))
                Text("\(list.main.temp.round)º")
                    .font(.title)
                    .foregroundColor(.black)
            }
            HStack{
                IconView(icon: "humidity")
                    .font(.system(size: 16, weight: .ultraLight))
                Text("\(list.main.humidity)%")
                   .foregroundColor(.black)
            }
            .padding([.leading, .trailing])
        }
    }
}


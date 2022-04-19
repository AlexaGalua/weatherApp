//
//  CardView.swift
//  WeatherForecast
//
//  Created by A on 4/10/22.
//

import SwiftUI

struct CardView: View {
    var list: ListData

    var body: some View {
        VStack (alignment: .center, spacing: 10) {
            Text(dayOfTheWeekFromTimestamp(list.dt.timestamp))
                //.font(.title(size: 65))
                .foregroundColor(.white)
                .font(.system(size: 20))
            HStack{
                IconView(icon: "thermometer", size: .small)
                Text("\(list.main.temp.round)º")
                    .font(.title)
                    .foregroundColor(.white)
            }
            HStack{
                IconView(icon: "humidity", size: .small)
                Text("\(list.main.humidity)%")
                   .foregroundColor(.white)
            }
            IconView (icon: list.weather.last?.icon, size: .large)
            //Text(list.weather.last?.description ?? "Unkown")
                .font(.body)
                .foregroundColor(.white)
        }
    }
}

struct CardViewModifier: ViewModifier {
    var timestamp: TimeInterval

    init(_ timestamp: TimeInterval) {
        self.timestamp = timestamp
    }

    func body(content: Content) -> some View {
        content
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
    }

    private var day: String {
        return dayOfTheWeekFromTimestamp(self.timestamp)
    }
}

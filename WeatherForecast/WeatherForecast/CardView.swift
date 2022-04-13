//
//  CardView.swift
//  WeatherForecast
//
//  Created by 1 on 4/10/22.
//

import SwiftUI

struct CardView: View {
    var list: ListData

    var body: some View {
        VStack (alignment: .center){
            Text(dayOfTheWeekFromTimestamp(list.dt.timestamp))
                .font(.title)
                .foregroundColor(.white)
            HStack{
                Text("\(list.main.humidity)%")
                Text("\(list.main.temp.round)º")
                    .font(.title)
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

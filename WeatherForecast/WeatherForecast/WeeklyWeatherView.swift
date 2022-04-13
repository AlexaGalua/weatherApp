//
//  File.swift
//  WeatherForecast
//
//  Created by 1 on 4/10/22.
//

import SwiftUI

struct WeeklyWeatherView: View {
    var listData: [ListData] = []
    var value: Int = 0
    var height: CGFloat = 0
    var width = UIScreen.main.bounds.width / 4

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(listData) { list in
                    CardView(list: list)
                    .frame(width: self.width, height: self.value == 0 ? 0 : self.height * 0.60)
                    .animation(.easeInOut(duration: 0.5))
                    .modifier(CardViewModifier(list.dt.timestamp))
                }
            }
        }.padding(20)
        .frame(height: self.value == 0 ? 0 : self.height * 0.65).animation(.easeInOut(duration: 0.5))
    }
}

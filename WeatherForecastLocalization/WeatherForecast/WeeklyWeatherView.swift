//
//  File.swift
//  WeatherForecast
//
//  Created by A on 4/10/22.
//

import SwiftUI

struct WeeklyWeatherView: View {
    var listData: [ListData] = []

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(listData) { list in
                    CardView(list: list)
                }
            }
        }
    }
}

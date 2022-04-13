//
//  ContentView.swift
//  WeatherForecast
//
//  Created by 1 on 4/9/22.
//

import SwiftUI


struct ContentView: View {
    @State private var selected = 0
    @ObservedObject var weather = CurrentWeatherViewModel()
    @ObservedObject var weeklyWeather = WeeklyWeatherViewModel()
    private var height = UIScreen.main.bounds.height
    @State var city: String = ""
    
    var body: some View{
        VStack {
            HStack{
                
            TextField("Enter your city", text: $city, onCommit: {
                self.weather.fetch(self.city)
                self.weeklyWeather.fetch(by: self.city)
            })
            }
                .pickerStyle(SegmentedPickerStyle())
              .padding(.horizontal)
              .frame(width: 375, height: 20)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 20).strokeBorder(Color.blue, style: StrokeStyle(lineWidth: 2.0)))
                            .foregroundColor(.green)
            
            GeometryReader{ gr in
                CurrentWeather(weather: self.weather.current, height: self.selected == 0 ? gr.size.height : gr.size.height * 1)
                    .animation(.easeInOut(duration: 0.5))
                    .cornerRadius(20)
            }

            WeeklyWeatherView(listData: weeklyWeather.weather?.list ?? [], value: selected, height: height * 0.5)

            VStack{
                Picker("", selection: $selected){
                    Text("Today")
                        .tag(0)
                    Text("Week")
                        .tag(1)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}


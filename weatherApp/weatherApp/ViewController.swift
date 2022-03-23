//
//  ViewController.swift
//  weatherApp
//
//  Created by A on 3/11/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet var table: UITableView!
    
    var models = [List]()
    var models2 = [Welcome]()
    var current: City?
    var current2: List?
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        table.register(HourlyTableViewCell.nib(), forCellReuseIdentifier: HourlyTableViewCell.identifier)
        table.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: WeatherTableViewCell.identifier)
        table.backgroundColor = UIColor(red: 52/255.0, green: 109/255.0, blue: 179/255.0, alpha: 1.0)
        view.backgroundColor = UIColor(red: 52/255.0, green: 109/255.0, blue: 179/255.0, alpha: 1.0)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLocation()
    }
    
    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.startUpdatingLocation()
            requestWeatherForLocation()
        }
    }
    
    func requestWeatherForLocation() {
        guard let currentLocation = currentLocation else {
            return
        }

//        let lon = currentLocation.coordinate.longitude
//        let lat = currentLocation.coordinate.latitude
        
//        let API_URL = "http://api.openweathermap.org/data/2.5/weather?q=\(formattedCity)&appid=\(NetworkProperties.API_KEY)"
//        let formattedCity = city.replacingOccurrences(of: " ", with: "+")
//        let url = "https://api.openweathermap.org/data/2.5/forecast?id=524901&appid=e56577d8f032bc31ab1e10d0bb3f513e"
    let url = "https://api.openweathermap.org/data/2.5/forecast?appid=e56577d8f032bc31ab1e10d0bb3f513e&lat=53.53&lon=27.34&units=metric"
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
        
        guard let data = data, error == nil
        else {
            print("something went wrong")
            return
        }
        
            var json: Welcome?
            do {
                json = try JSONDecoder().decode(Welcome.self, from: data)
            }
            catch {
                print("error: \(error)")
            }

            guard let result = json else {
                return
            }
            
            print(result)
            
            let entrise = result.list
            
            self.models.append(contentsOf: entrise)
            
            
            let current = result.city
            self.current = current
            
            let current3 = result.city
            self.current = current3
            
            let current2 = result.city
            self.current = current2
            
            DispatchQueue.main.async {
                self.table.reloadData()
                self.table.tableHeaderView = self.createTableHeader()
            }
            
        }).resume()
       
    }
    
    func createTableHeader() -> UIView {
        let headerVIew = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))

        headerVIew.backgroundColor = UIColor(red: 52/255.0, green: 109/255.0, blue: 179/255.0, alpha: 1.0)

        let locationLabel = UILabel(frame: CGRect(x: 10, y: 10, width: view.frame.size.width-20, height: headerVIew.frame.size.height/5))
        let summaryLabel = UILabel(frame: CGRect(x: 10, y: 20+locationLabel.frame.size.height, width: view.frame.size.width-20, height: headerVIew.frame.size.height/5))
        let tempLabel = UILabel(frame: CGRect(x: 10, y: 20+locationLabel.frame.size.height+summaryLabel.frame.size.height, width: view.frame.size.width-20, height: headerVIew.frame.size.height/2))

        headerVIew.addSubview(locationLabel)
        headerVIew.addSubview(tempLabel)
        headerVIew.addSubview(summaryLabel)

        tempLabel.textAlignment = .center
        locationLabel.textAlignment = .center
        summaryLabel.textAlignment = .center

        locationLabel.text = "Current Location"
        tempLabel.text = "12°C"
        summaryLabel.text = "Minsk"
        
//        let currentWeather = self.current
//        let currentWeather2 = self.models
//        guard let currentWeather3 = self.current2?.main.temp else {
//            return UIView()
//        }
//
//        guard let currentWeather = self.current else {
//            return UIView()
//        }
//
//        tempLabel.text = "temp \(currentWeather3)°"
        tempLabel.font = UIFont(name: "Helvetica-Bold", size: 32)
        summaryLabel.font = UIFont(name: "Helvetica-Bold", size: 32)
//        summaryLabel.text = self.current?.name

        return headerVIew
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
        cell.configure(with: models[indexPath.row])
        cell.backgroundColor = UIColor(red: 52/255.0, green: 109/255.0, blue: 179/255.0, alpha: 1.0)
//        cell.configure2(with: models2)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
//    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: MainClass
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility, pop: Int
    let sys: Sys
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: String
    let weatherDescription: Description
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

//enum MainEnum: String, Codable {
//    case clear = "Clear"
//    case clouds = "Clouds"
//}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}




//struct Weather: Codable {
//    let 0: [WeatherSettings]
//}

//struct Weather: Codable {
//    let id: Float?
//    let main: String?
//    let description: String?
//    let icon: String?
//}
//
//struct Clouds: Codable {
//    let all: Float?
//}
//
//struct Wind: Codable {
//    let speed: Float?
//    let deg: Float?
//    let gust: Float?
//}
//
//struct Sys: Codable {
//    let pod: String?
//    let country: String?
//    let sunrise: Int?
//    let sunset: Int?
//}

//
//struct Main: Codable {
//    let temp: Float
//    let feels_like: Float
//    let temp_min: Float
//    let temp_max: Float
//    let pressure: Float
//    let humidity: Float
//}
//struct WeatherModel: Codable {
//    let weather: [Weather]
//    let main: Main
//    let sys: Sys
//    let name: String?
//    let dt: Int
//    let timezone: Int?
//    let dt_txt: String?
//}




//struct WeatherResponse: Codable{
//    let lat: Float
//    let lon: Float
//    let timezone: String
//    let currently: CurrentWeather
//    let hourly: HourlyWeather
//    let daily: DailyWeather
//    let offset: Float
//}

//struct Weather: Codable {
//    let something: String
//}

//struct CurrentWeather: Codable {
//    let time: Int
//    let summary: String
//    let icon: String
//    let nearestStormDistance: Int
//    let nearestStormBearing: Int
//    let precipIntensity: Int
//    let precipProbability: Int
//    let temperature: Double
//    let apparentTemperature: Double
//    let dewPoint: Double
//    let humidity: Double
//    let pressure: Double
//    let windSpeed: Double
//    let windGust: Double
//    let windBearing: Int
//    let cloudCover: Double
//    let uvIndex: Int
//    let visibility: Double
//    let ozone: Double
//}
//
//struct DailyWeather: Codable {
//    let summary: String
//    let icon: String
//    let data: [DailyWeatherEntry]
//}
//
//struct DailyWeatherEntry: Codable {
//    let time: Int
//    let summary: String
//    let icon: String
//    let sunriseTime: Int
//    let sunsetTime: Int
//    let moonPhase: Double
//    let precipIntensity: Float
//    let precipIntensityMax: Float
//    let precipIntensityMaxTime: Int
//    let precipProbability: Double
//    let precipType: String?
//    let temperatureHigh: Double
//    let temperatureHighTime: Int
//    let temperatureLow: Double
//    let temperatureLowTime: Int
//    let apparentTemperatureHigh: Double
//    let apparentTemperatureHighTime: Int
//    let apparentTemperatureLow: Double
//    let apparentTemperatureLowTime: Int
//    let dewPoint: Double
//    let humidity: Double
//    let pressure: Double
//    let windSpeed: Double
//    let windGust: Double
//    let windGustTime: Int
//    let windBearing: Int
//    let cloudCover: Double
//    let uvIndex: Int
//    let uvIndexTime: Int
//    let visibility: Double
//    let ozone: Double
//    let temperatureMin: Double
//    let temperatureMinTime: Int
//    let temperatureMax: Double
//    let temperatureMaxTime: Int
//    let apparentTemperatureMin: Double
//    let apparentTemperatureMinTime: Int
//    let apparentTemperatureMax: Double
//    let apparentTemperatureMaxTime: Int
//}
//
//struct HourlyWeather: Codable {
//    let summary: String
//    let icon: String
//    let data: [HourlyWeatherEntry]
//}
//
//struct HourlyWeatherEntry: Codable {
//    let time: Int
//    let summary: String
//    let icon: String
//    let precipIntensity: Float
//    let precipProbability: Double
//    let precipType: String?
//    let temperature: Double
//    let apparentTemperature: Double
//    let dewPoint: Double
//    let humidity: Double
//    let pressure: Double
//    let windSpeed: Double
//    let windGust: Double
//    let windBearing: Int
//    let cloudCover: Double
//    let uvIndex: Int
//    let visibility: Double
//    let ozone: Double
//}

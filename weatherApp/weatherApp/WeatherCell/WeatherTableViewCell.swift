//
//  WeatherTableViewCell.swift
//  weatherApp
//
//  Created by A on 3/20/22.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet var tempLable:UILabel!
    @IBOutlet var feelsLikeLable:UILabel!
    @IBOutlet var tempMinLable:UILabel!
    @IBOutlet var tempMaxLable:UILabel!
//    @IBOutlet var pressureLable:UILabel!
//    @IBOutlet var humidityLable:UILabel!
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let identifier = "WeatherTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "WeatherTableViewCell", bundle: nil)
    }
    
    func configure(with model: List) {
        self.tempLable.textAlignment = .center
        self.tempLable.text = "\(Int(model.main.temp))°"
        self.feelsLikeLable.textAlignment = .center
        self.feelsLikeLable.text = "\(Int(model.main.feelsLike))°"
        self.tempMaxLable.textAlignment = .center
        self.tempMinLable.textAlignment = .center
        self.tempMinLable.text = "\(Int(model.main.tempMin))°"
        self.tempMaxLable.text = "\(Int(model.main.tempMax))°"
//        self.pressureLable.textAlignment = .center
//        self.pressureLable.text = "\(Int(model.main.pressure))"
//        self.humidityLable.textAlignment = .center
//        self.humidityLable.text = "\(Int(model.main.humidity))"
        
//        self.dayLabel.text = getDayForDate(Date(timeIntervalSinceNow: Double(model.dt) ?? default value))
//
//        self.dayLabel.text = getDayForDate(Date(timeIntervalSince1970: String(model.dtTxt)))
        
        self.dayLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(model.dt)))
        self.iconImageView.contentMode = .scaleAspectFit

        let icon = model.weather.first?.main.lowercased()
        if ((icon?.contains("Clear")) != nil) {
            self.iconImageView.image = UIImage(named: "sun")
        }
//        else if ((icon?.contains("Clouds")) != nil) {
//            self.iconImageView.image = UIImage(named: "cloudy")
//        }
        else {
            // cloud icon
            self.iconImageView.image = UIImage(named: "cloudy")
        }

    }
    
    func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date else {
            return ""
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM h:mm" 
        return formatter.string(from: inputDate)
    }
    
}

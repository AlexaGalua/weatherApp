//
//  Localization.swift
//  WeatherForecast
//
//  Created by А on 4/12/22.
//

import SwiftUI

extension String {
    func localizated() -> String {
        return NSLocalizedString(self,
                                 tableName: "Localization",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}

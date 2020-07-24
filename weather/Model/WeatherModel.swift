//
//  WeatherModel.swift
//  weather
//
//  Created by Swamita on 24/07/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//

import Foundation
import UIKit

struct WeatherModel{
    let conditionId: Int
    let cityName: String
    let description: String
    let minTemperature: Double
    let temperature: Double
    let maxTemperature: Double
    let windSpeed: Double
    let windDegree: Int
    
    var conditionIcon:UIImage?{
        switch conditionId {
        case 200...232:
            return UIImage(named: "thunder")
        case 300...321:
            return UIImage(named: "tropical")
        case 500...531:
            return UIImage(named: "rain")
        case 600...622:
            return UIImage(named: "winter")
        case 701...781:
            return UIImage(named: "breezy")
        case 800:
            return UIImage(named: "summer")
        case 801...804:
            return UIImage(named: "summer")
        default:
            return UIImage(named: "summer")
        }
    }
    
    var conditionName: String{
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var min_temperatureString: String {
        return String(format: "%.1f", minTemperature)
    }
    
    var max_temperatureString: String {
        return String(format: "%.1f", maxTemperature)
    }
    
    var windString: String {
        return String(format: "%.1f", windSpeed)
    }
    
    var windDirection: String {
        switch windDegree {
        case 0:
            return "North"
        case 1...89:
            return "NE"
        case 90:
            return "East"
        case 91...179:
            return "SE"
        case 180:
            return "South"
        case 181...269:
            return "SW"
        case 270:
            return "West"
        case 271...359:
            return "NW"
        default:
            return "North"
        }
    }
}



//
//  WeatherModel.swift
//  WeatherApp-FinalProject
//
//  Created by Matt Dolidze on 01.02.21.
//

import Foundation

struct CurrentWeatherData {
    let cityName: String
    let temperature: Double
    let weatherType: String
    let cloudiness: Int
    let humidity: Int
    let windSpeed: Float
    let windDirection: Int
    
    
    func getWindDirectionInText() -> String {
        switch windDirection {
        case 25..<70:
            return "NE"
        case 70..<115:
            return "E"
        case 115..<160:
            return "SE"
        case 160..<205:
            return "S"
        case 205..<250:
            return "SW"
        case 250..<295:
            return "W"
        case 295..<340:
            return "NW"
        default:
            return "N"
        }
    }
    
    func getWindSpeedInText() -> String {
        return "\(windSpeed) km/h"
    }
    
    func getHumidityInText() -> String {
        return "\(humidity) mm"
    }
    
    func getCloudinessInText() -> String {
        return "\(cloudiness) %"
    }
    
    func getTemperatureInText() -> String {
        return "\(temperature) C"
    }
}


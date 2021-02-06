//
//  WeatherData.swift
//  WeatherApp-FinalProject
//
//  Created by Matt Dolidze on 01.02.21.
//

import Foundation

struct CurrentWeatherJSON : Decodable{
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
    let clouds: Clouds
}

struct Main : Decodable {
    let temp: Double
    let humidity: Int
}

struct Weather : Decodable {
    let main: String
    let description: String
    let icon: String
}

struct Wind : Decodable {
    let speed: Float
    let deg: Int
}

struct Clouds : Decodable {
    let all : Int
}

struct ForecastWeatherJSON : Decodable {
    let list : [List]
}

struct List : Decodable {
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let dt_txt: String
    let city: City
}

struct City : Decodable {
    let name: String
    let country: String
}

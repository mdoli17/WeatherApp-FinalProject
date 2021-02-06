//
//  WeatherPresenter.swift
//  WeatherApp-FinalProject
//
//  Created by Matt Dolidze on 01.02.21.
//

import Foundation

protocol WeatherDataReadable {
    func GetWeatherDataForCurrentDay()
}

protocol WeatherDataRecievable {
    func OnWeatherForCurrentDayRecieved()
}
protocol UIUpdateable {
    func UpdateCurrentDayUI()
}

class WeatherPresenter {
    private static var instance = WeatherPresenter()
    public static var shared : WeatherPresenter { get { instance } }

    weak private var weatherView : WeatherView?
    private var weatherManager = WeatherManager.shared
    
    private init() {
        
    }
    
    public func injectView(weatherView: WeatherView) {
        self.weatherView = weatherView
    }
    public func ejectView() {
        self.weatherView = nil
    }
    
    
}

extension WeatherPresenter : WeatherDataReadable {
    func GetWeatherDataForCurrentDay(){
        weatherManager.GetWeatherForToday(city: "Tbilisi")
    }
}

extension WeatherPresenter : WeatherDataRecievable
{
    func OnWeatherForCurrentDayRecieved() {
        weatherView?.UpdateUI()
    }
}


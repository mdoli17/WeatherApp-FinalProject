//
//  WeatherManager.swift
//  WeatherApp-FinalProject
//
//  Created by Matt Dolidze on 01.02.21.
//

import Foundation

class WeatherManager {
    private static let instance = WeatherManager()
    public static var shared : WeatherManager { get { instance } }
    
    var weatherData : CurrentWeatherData?
    
    private let currentWeatherURL = "https://api.openweathermap.org/data/2.5/weather?q="
    private let forecastURL = "api.openweathermap.org/data/2.5/forecast?q="
    private let urlKey = "&appid=893f82ff52c071646ba64d7afeffa50b&units=metric"

        
    public func GetWeatherForToday(city: String)
    {
        fetchCurrentWeatherData(city: city)
    }
    
    public func GetWeatherForecast(cigy: String)
    {
        
    }
    
    private func fetchCurrentWeatherData(city: String) {
        if let url = URL(string: currentWeatherURL + city + urlKey) {
            URLSession.shared.dataTask(with: url) {data, response, error in
                if let data = data {
                    
                    if let weatherData = self.parseJSON(weatherData: data)
                    {
                        print("City Name: \(weatherData.cityName)")
                        print("Temperature: \(weatherData.getTemperatureInText())")
                        print("Weather Type: \(weatherData.weatherType)")
                        print("Cloudiness: \(weatherData.getCloudinessInText())")
                        print("Humidity: \(weatherData.getHumidityInText())")
                        print("Wind Speed: \(weatherData.getWindSpeedInText())")
                        print("Wind Direction: \(weatherData.getWindDirectionInText())")
                    }
                }
            }.resume()
        }
    }
    
    private func fetchForecastWeatherData(city: String) {
        
    }
    
    private func parseJSON(weatherData: Data) -> CurrentWeatherData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrentWeatherJSON.self, from: weatherData)
            let cityName = decodedData.name
            let temperature = decodedData.main.temp
            let weatherType = decodedData.weather[0].main
            let cloudiness = decodedData.clouds.all
            let humidity = decodedData.main.humidity
            let windSpeed = decodedData.wind.speed
            let windDirection = decodedData.wind.deg
            
            let weatherData = CurrentWeatherData(cityName: cityName, temperature: temperature, weatherType: weatherType, cloudiness: cloudiness, humidity: humidity, windSpeed: windSpeed, windDirection: windDirection)
            return weatherData
        } catch
        {
            print(error)
            return nil
        }
    }
    
    
}

class JSONParser {
    typealias ResultBlock<T: Decodable> = (Result <T, Error>) -> Void
    
    static func ParseData<T: Decodable>(of type: T, from data: Data, completion: @escaping ResultBlock<T>) {
        do {
            let decodedData: T = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
}

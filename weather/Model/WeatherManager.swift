//
//  WeatherManager.swift
//  weather
//
//  Created by Swamita on 24/07/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager,weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4e3049065e0729d2fed613ec0613ac21&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                else {
                    if let safeData = data {
                        if let weather = self.parseJSON(safeData){
                            self.delegate?.didUpdateWeather(self, weather: weather)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id=decodedData.weather[0].id
            let description = decodedData.weather[0].description
            let temp = decodedData.main.temp
            let name = decodedData.name
            let temp_min = decodedData.main.temp_min
            let temp_max = decodedData.main.temp_max
            let speed = decodedData.wind.speed
            let deg = decodedData.wind.deg
            
            let weather = WeatherModel(conditionId: id, cityName: name, description: description, minTemperature: temp, temperature: temp_min, maxTemperature: temp_max, windSpeed: speed, windDegree: deg)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            print(error)
            return nil
        }
    }
}

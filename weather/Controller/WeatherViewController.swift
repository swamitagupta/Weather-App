//
//  WeatherViewController.swift
//  weather
//
//  Created by Swamita on 24/07/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var direction: UILabel!
    @IBOutlet weak var searchField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        searchField.delegate = self
    }
    
    @IBAction func searchPressed(_ sender: Any) {
    }
    @IBAction func locationPressed(_ sender: Any) {
    }
    
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate{
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async{
            self.descriptionLabel.text = weather.description
            self.cityLabel.text = weather.cityName
            self.weatherIcon.image = UIImage(systemName: weather.conditionName)
            self.currentTemp.text = "\(weather.temperatureString)°C"
            self.minTemp.text = "\(weather.min_temperatureString)°C"
            self.maxTemp.text = "\(weather.max_temperatureString)°C"
            self.speed.text = "\(weather.windSpeed) mph, "
            self.direction.text = "\(weather.windDirection) direction"
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }
        else {
            textField.placeholder = "Type something..."
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchField.text = ""
    
    }
}

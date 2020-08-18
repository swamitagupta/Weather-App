//
//  DetailViewController.swift
//  weather
//
//  Created by Swamita on 14/08/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var grayDescription: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var details = [["Temperature",0],["Pressure",0],["Humidity",0],["Visibility",0],["Sunrise",0],["Sunset",0]]
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        weatherManager.delegate = self
        // Do any additional setup after loading the view.
    }
}
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = "\(details[indexPath.row][0]):\(details[indexPath.row][1])"

        return cell
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 5
     }

}

//MARK: - WeatherManagerDelegate

extension DetailViewController: WeatherManagerDelegate{
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async{
            self.cityName.text = weather.cityName
            self.grayDescription.text = weather.description
            self.details[0][1] = weather.temperature
            self.details[1][1] = weather.pressure
            self.details[2][1] = weather.humidity
            self.details[3][1] = weather.visibility
            self.details[4][1] = weather.sunrise
            self.details[5][1] = weather.sunset
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

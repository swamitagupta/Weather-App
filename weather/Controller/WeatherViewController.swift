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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchPressed(_ sender: Any) {
    }
    @IBAction func locationPressed(_ sender: Any) {
    }
    
}

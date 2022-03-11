//
//  ViewController.swift
//  MyWeatherApp
//
//  Created by MOHAMED ELDIMARDASH on 04/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HourlyForecast.downloadHourlyForecast { hourlyForecastArr in
            for data in hourlyForecastArr {
                // printing forecast data in debug area
                print("forecast data: ", data.temp, data.date, data.weatherIcon)
            }
        }
    }
}


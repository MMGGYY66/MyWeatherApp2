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
        // Do any additional setup after loading the view.
        //        let currentWeather = CurrentWeather()
        //
        //        currentWeather.getCurrentWeather { success in
        //            print("City is ", currentWeather.city, currentWeather.currentTemp)
        //        }
        HourlyForecast.downloadHourlyForecast { hourlyForecastArr in
            for data in hourlyForecastArr {
                // printing forecast data in debug area
                print("forecast data: ", data.temp, data.date, data.weatherIcon)
            }
        }
    }
}


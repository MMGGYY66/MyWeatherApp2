//
//  CurrentWeather.swift
//  MyWeatherApp
//
//  Created by MOHAMED ELDIMARDASH on 04/03/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class CurrentWeather {
    private var _city: String!
    private var _date: Date!
    private var _currentTemp: Double!
    private var _feelsLike: Double!
    private var _uv: Double!
    
    private var _weatherType: String!
    private var _pressure: Double!   // mb
    private var _humidity: Double!  // %
    private var _windSpeed: Double!  // meter/second
    private var _weatherIcon: String!
    private var _visibility: Double!  // km
    private var _sunrise: String!
    private var _sunset: String!

    // public getters
    var city: String {
        if _city == nil {
            _city = ""
        }
        return _city
    }
    var date: Date {
        if _date == nil {
            _date = Date()
        }
        return _date
    }
    
    var uv: Double {
        if _uv == nil {
            _uv = 0.0
        }
        return _uv
    }
    var sunrise: String {
        if _sunrise == nil {
            _sunrise = ""
        }
        return _sunrise
    }
    var sunset: String {
        if _sunset == nil {
            _sunset = ""
        }
        return _sunset
    }
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    var feelsLike: Double {
        if _feelsLike == nil {
            _feelsLike = 0.0
        }
        return _feelsLike
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    var pressure: Double {
        if _pressure == nil {
            _pressure = 0.0
        }
        return _pressure
    }
    var humidity: Double {
        if _humidity == nil {
            _humidity = 0.0
        }
        return _humidity
    }
    var windSpeed: Double {
        if _windSpeed == nil {
            _windSpeed = 0.0
        }
        return _windSpeed
    }
    var weatherIcon: String {
        if _weatherIcon == nil {
            _weatherIcon = ""
        }
        return _weatherIcon
    }
    var visibility: Double {
        if _visibility == nil {
            _visibility = 0.0
        }
        return _visibility
    }

    
    func getCurrentWeather(completion: @escaping(_ success: Bool)-> Void) {
        let LOCATION_URL = "https://api.weatherbit.io/v2.0/current?&city=Cairo&country=EG&key=3735a2a546b2415c9d1ef62a9903d547&include=minutely"
        Alamofire.request(LOCATION_URL).responseJSON { response in
            let result = response.result
            if result.isSuccess {
                let json = JSON(result.value as Any)
                // print(json)
                self._city = json["data"][0]["city_name"].stringValue
                self._date = getCurrentDateFromUnix(unixDate: json["data"][0]["ts"].double)
                self._weatherType = json["data"][0]["weather"]["description"].stringValue
                self._currentTemp = json["data"][0]["temp"].double
                self._pressure = json["data"][0]["pres"].double
                self._humidity = json["data"][0]["rh"].double
                self._windSpeed = json["data"][0]["wind_spd"].double
                self._weatherIcon = json["data"][0]["weather"]["icon"].stringValue
                self._visibility = json["data"][0]["vis"].double
                self._uv = json["data"][0]["uv"].double
                self._sunrise = json["data"][0]["sunrise"].stringValue
                self._sunset = json["data"][0]["sunset"].stringValue
                
                completion(true)
            }else{
                completion(false)
                print("No result for location")
            }
        }
    }
}

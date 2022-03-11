//
//  HourlyForecast.swift
//  MyWeatherApp
//
//  Created by MOHAMED ELDIMARDASH on 05/03/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class HourlyForecast {
    private var _date: Date!
    private var _temp: Double!
    private var _weatherIcon: String!
    
    // public getters
    var date: Date{
        if _date == nil {
            _date = Date()
        }
        return _date
    }
    var temp: Double {
        if _temp == nil {
            _temp = 0.0
        }
        return _temp
    }
    
    var weatherIcon: String{
        if _weatherIcon == nil {
            _weatherIcon = ""
        }
        return _weatherIcon
    }
    
    init(weatherDictionary: Dictionary<String, AnyObject>){
        let json = JSON(weatherDictionary)
        self._date = getCurrentDateFromUnix(unixDate: json["ts"].double!)
        self._temp = json["temp"].double
        self._weatherIcon = json["weather"]["icon"].stringValue
    }
    
    class func downloadHourlyForecast(completion: @escaping(_ hourlyForecast: [HourlyForecast]) -> Void){
        let HOURLY_FORECAST_URL = "https://api.weatherbit.io/v2.0/forecast/hourly?city=Cairo&country=EG&hours=24&key=3735a2a546b2415c9d1ef62a9903d547&include=minutely"
        
        Alamofire.request(HOURLY_FORECAST_URL).responseJSON { response in
            let result = response.result
            var forecastArray: [HourlyForecast] = []
            
            if result.isSuccess {
                if let dictionary = result.value as? Dictionary<String, AnyObject>{
                    if let list = dictionary["data"] as? [Dictionary<String, AnyObject>] {
                        for item in list {
                            let forecast = HourlyForecast(weatherDictionary: item)
                            forecastArray.append(forecast)
                        }
                    }
                }
                completion(forecastArray)
                
            }else{
                completion(forecastArray)

                print("not found")
            }
        }
    }
}

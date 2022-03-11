//
//  GlobalHelpers.swift
//  MyWeatherApp
//
//  Created by MOHAMED ELDIMARDASH on 04/03/2022.
//

import Foundation

func getCurrentDateFromUnix(unixDate: Double?) -> Date? {
    if unixDate != nil {
        return Date(timeIntervalSince1970: unixDate!)
    }
    return Date()
}

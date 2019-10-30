//
//  Clima.swift
//  Clima
//
//  Created by admin on 2019/10/30.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation


struct Clima {
    
    
    var condition = ""
    var temp = 0
    var conditionID:Int?
    
    let apiKey = "e2f482f1b98910e0e9ce5638fad56871"
    let basicUrl = "http://api.openweathermap.org/data/2.5/weather"
//
    
    func getWeatherByCity(city:String)  {
        let requestDataByCity = "\(basicUrl)?APPID=\(apiKey)&q=\(String(describing: city))"
        print(requestDataByCity)
    }
    
    func getWeatherByCoordinates(lat:Double,lon:Double)  {
        let requestDataByCoordinates = "\(basicUrl)?APPID=\(apiKey)&lat=\(lat)&lon=\(lon)"
        print(requestDataByCoordinates)
      }
    
//    switch conditionID {
//    case 200...232:
//        return "cloud.bolt"
//    case 300...321:
//        return "cloud.drizzle"
//    case 500...531:
//        return "cloud.rain"
//    case 600...622:
//        return "cloud.snow"
//    case 701...781:
//        return "cloud.fog"
//    case 800:
//        return "sun.max"
//    case 801...804:
//        return "cloud.bolt"
//    default:
//        return "cloud"
}
    
    


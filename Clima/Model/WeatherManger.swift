//
//  Clima.swift
//  Clima
//
//  Created by admin on 2019/10/30.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation


struct WeatherManger {
    var condition = ""
    var temp = 0
    var conditionID:Int?
    let defaultSession = URLSession(configuration: .default)
    
    let apiKey = "e2f482f1b98910e0e9ce5638fad56871"
    let basicUrl = "http://api.openweathermap.org/data/2.5/weather"
//
    
    func getWeatherByCity(city:String) {
        let urlString  = "\(basicUrl)?APPID=\(apiKey)&q=\(String(describing: city))"
        print(urlString)
        getWeatcherData(urlString:urlString)

    }
    
    func getWeatherByCoordinates(lat:Double,lon:Double) {
        let urlString = "\(basicUrl)?APPID=\(apiKey)&lat=\(lat)&lon=\(lon)"
        getWeatcherData(urlString:urlString)
      }
    
    
    func getWeatcherData(urlString:String) {
        //Create a URL
        if let url = URL(string:urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url)
            task.resume()
        }
    }    
}
    
    
    
    


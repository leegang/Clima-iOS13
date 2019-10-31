//
//  Clima.swift
//  Clima
//
//  Created by admin on 2019/10/30.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation
import SwiftyJSON


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
        self.getWeatcherData(urlString:urlString)

    }
    
    func getWeatherByCoordinates(lat:Double,lon:Double) {
        let urlString = "\(basicUrl)?APPID=\(apiKey)&lat=\(lat)&lon=\(lon)"
        self.getWeatcherData(urlString:urlString)
      }
    
    
    func getWeatcherData(urlString:String) {
        //Create a URL
        if let url = URL(string:urlString) {
            // create a session
            let session = URLSession(configuration: .default)
            // creat a task with the request url
            let task = session.dataTask(with: url) { (data, urlRespone, error) in
                // pass a closure to accept the data and error
                if error != nil {
                    print(error!)
                    return
                }
                if let weatherData = data {
                    self.parseData(weatherData)
               }
            }
            task.resume()
        }
        }
    
    
    func parseData(_ weatherData:Data){
        do {
            let weatherDataJson = try JSON(data: weatherData)
            let temp = weatherDataJson["main","temp"].double!
            let cod = weatherDataJson["weather",0,"id"].int!
            let cityName = weatherDataJson["name"].string!
            let weatherDatavalue = WeatherData(temp: temp,cityName:cityName,cod:cod)
        
        }
        catch{
            print(error)
        }
       
    }
}
    
    
    
    


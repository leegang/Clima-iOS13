//
//  WeatherData.swift
//  Clima
//
//  Created by leegang on 2019/10/31.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct WeatherData {
    let temp:Double
    let cityName:String
    let cod:Int
    
    init(temp:Double,cityName:String,cod:Int) {
        self.temp = temp
        self.cityName = cityName
        self.cod = cod
    }
    
    var wetherName:String{
        switch cod {
               case 200...232:
                   return  "cloud.bolt"
               case 300...321:
                   return "cloud.drizzle"
               case 500...531:
                   return "cloud.rain"
               case 600...622:
                   return "cloud.snow"
               case 701...781:
                   return "cloud.fog"
               case 800:
                   return "sun.max"
               case 801...804:
                   return "cloud.bolt"
               default:
                   return  "cloud"
               }
    }
    
    func getTempCText() ->String {
        let tempC =  (temp - 32)/18
        let cText = String(format: "%.f", tempC)
        return cText
    }
    
    
    func getWeatherImage() -> UIImage {
        return UIImage(systemName:wetherName)!
    }
}

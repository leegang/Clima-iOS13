//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var climaToday = WeatherManger()
    var city:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        climaToday.delegate = self
        searchTextField.keyboardType = .webSearch
        // Do any additional setup after loading the view.
    }
}

extension WeatherViewController:UITextFieldDelegate{

        @IBAction func searchButtonPressed(_ sender: UIButton) {
            searchTextField.endEditing(true)
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.endEditing(true)
            return true
        }
        
         func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
               if textField.text != "" {
    //             cityLabel.text = searchTextField.text
                   return true
               } else {
                   textField.placeholder = "Type something"
                   return false
               }
           }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            if let cityName = searchTextField.text   {
                climaToday.getWeatherByCity(city:cityName)
            }
            textField.text = ""
        }
}
    
    
extension WeatherViewController:WeatherManagerDelegate{
        func didUpdateWeather(weather:WeatherData) {
               DispatchQueue.main.async{
                   self.temperatureLabel.text = weather.getTempCText()
                   self.conditionImageView.image = weather.getWeatherImage()
                   self.cityLabel.text = weather.cityName
               }
           }
           
           func didHandleError(error: Error) {
               self.cityLabel.text = error as? String
           }

}
    



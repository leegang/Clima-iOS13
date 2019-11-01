//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    let locationManager = CLLocationManager()
    

    var climaToday = WeatherManger()
    var city:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.keyboardType = .webSearch
        locationManager.requestWhenInUseAuthorization()
        updateLocation()
        searchTextField.delegate = self
        climaToday.delegate = self
        locationManager.delegate = self
        
        
        }
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        updateLocation()
    }
    
    
    func updateLocation()  {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestLocation()
        }
    }
        // Do any additional setup after loading the view.
    }


// Mark: -UITextFieldDelegate
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
    
// Mark: -WeatherManagerDelegate

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


//Mark: -CLLocationManagerDelegate

extension WeatherViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
        climaToday.getWeatherByCoordinates(lat: locValue.latitude, lon: locValue.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
}
    
    






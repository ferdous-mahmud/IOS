//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

// UITextFieldDelegate for go button from keyboard
class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherViewControllerDelegate {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextFild: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // call own delegate
        searchTextFild.delegate = self
        weatherManager.delegate = self
    }
    
    // Search Button pressed
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        _ = checkNil(textField: searchTextFild)
    }
    
    // Go button pressed func
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return checkNil(textField: textField)
    }
    
    // Editing end or not
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return checkNil(textField: textField)
    }
    
    // Clear text Fields String
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Fetch Weather data
        if let city = searchTextFild.text{
            weatherManager.fetchWeather(cityName: city)
        }
        textField.placeholder = "Search"
        textField.text = ""
    }
    
    // Check have value nil or not
    func checkNil(textField: UITextField) -> Bool{
        if textField.text != "" {
            // Hide keyboard
            searchTextFild.endEditing(true)
            return true
        }
        else{
            textField.placeholder = "Please input city name.."
            return false
        }
    }
    
    // Check Weather Update with delegate pattern
    func didWeatherUpdate(_ weatherManager: WeatherManager,weather: WeatherModel){
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.tenperatureString
            //self.conditionImageView.image = weather.conditionName
        }
        
        print(weather.cityName)
        print(weather.conditionName)
    }
    
    // Error handaling
    func didFailedWithError(_ error: Error) {
        print(error)
    }
}


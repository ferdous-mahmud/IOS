//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

// UITextFieldDelegate for go button from keyboard
class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextFild: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ask user for allow location & request location
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        // call own delegate
        searchTextFild.delegate = self
        weatherManager.delegate = self
    }
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate{
    
    // Search Button pressed
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        //MARK: - Check Internet & give alart
        if Reachability.isConnectedToNetwork(){
            // Internet available
            _ = checkNil(textField: searchTextFild)
        }else{
            showAlart(sender)
        }
    }
    
    // Location Button pressed
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        
        //MARK: - Check Internet & give alart
        if Reachability.isConnectedToNetwork(){
            // Internet available
            locationManager.requestLocation()
        }else{
            showAlart(sender)
        }
        
    }
    
    // Show Alart
    func showAlart(_ sender: UIButton){
        // create the alert
        let alert = UIAlertController(title: "No Internet", message: "Please turn on mobile data or wifi connection.", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
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
}

//MARK: - WeatherViewControllerDelegate

extension WeatherViewController: WeatherViewControllerDelegate{
    
    // Check Weather Update with delegate pattern
    func didWeatherUpdate(_ weatherManager: WeatherManager,weather: WeatherModel){
        // Goto main thred
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.tenperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    // Error handaling
    func didFailedWithError(_ error: Error) {
        print(error)
    }
}


//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            locationManager.stopUpdatingLocation()
            
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            weatherManager.fetchWeather(latatude: lat, longitude: lon)
        }
    }
    
    // Handaling error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

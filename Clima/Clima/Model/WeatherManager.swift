//
//  WeatherManager.swift
//  Clima
//
//  Created by Ferdous Mahmud Akash on 9/16/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

//protocol for delegate pattern
protocol WeatherViewControllerDelegate {
    func didWeatherUpdate(_ weatherManager: WeatherManager,weather: WeatherModel)
    func didFailedWithError(_ error: Error)
}

struct WeatherManager {
    let weatherUIL = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    private let apiKey = "cbf839d6c47fc8fe8e6d798174c641b4"
    
    var delegate: WeatherViewControllerDelegate?

    // Fetch Weather data by Coordinates
    func fetchWeather(latatude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherUIL)&lat=\(latatude)&lon=\(longitude)&appid=\(apiKey)"
        performRequest(with: urlString)
    }
    
    // Fetch waather data by city Name
    func fetchWeather(cityName: String){
        let urlString = "\(weatherUIL)&q=\(cityName)&appid=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with url: String){
        // Step:1 Create a URL
        if let actualURL = URL(string: url){
            
            // Step:2 Create a urlSession
            let session = URLSession(configuration: .default)
            
            // Step:3 Give a task to urlSession
            let task = session.dataTask(with: actualURL) { data, URLResponse, error in
                if error != nil{
                    self.delegate?.didFailedWithError(error!)
                    return
                }
                
                if let safeData = data{
                    if let weather = perseJSON(safeData){
                        self.delegate?.didWeatherUpdate(self, weather: weather)                    }
                }
            }
            
            // Step:4 Start task
            task.resume()
        }
        
    }
    
    // Decoding 
    func perseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let city = decodedData.name
            let temp = decodedData.main.temp
            let id = decodedData.weather[0].id
            
            return WeatherModel(cityName: city, conditionID: id, temperature: temp)
        }
        catch{
            delegate?.didFailedWithError(error)
            return nil
        }
        
    }
}

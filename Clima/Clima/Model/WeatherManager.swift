//
//  WeatherManager.swift
//  Clima
//
//  Created by Ferdous Mahmud Akash on 9/16/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherUIL = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    private let appId = "cbf839d6c47fc8fe8e6d798174c641b4"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherUIL)&q=\(cityName)&appid=\(appId)"
        performRequest(url: urlString)
    }
    
    func performRequest(url: String){
        // Step:1 Create a URL
        if let actualURL = URL(string: url){
            
            // Step:2 Create a urlSession
            let session = URLSession(configuration: .default)
            
            // Step:3 Give a task to urlSession
            let task = session.dataTask(with: actualURL) { data, URLResponse, error in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    perseJSON(weatherData: safeData)
                }
            }
            
            // Step:4 Start task
            task.resume()
        }
        
    }
    
    // Decoding 
    func perseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.name)
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
        }
        catch{
            print(error)
        }
        
    }
}

//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

//protocol CoinManagerDelegate {
//    func curentPrice()
// ADDC3611-4052-4750-8E8A-D02C8A2C506A
//}

struct CoinManager {
    
    let mainURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = "Your_API_Key"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func fetchCurrency(currencyName: String){
        let urlString = "\(mainURL)\(currencyName)?apikey=\(apiKey)"
        
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        // 1 - Create a url
        if let url = URL(string: urlString){
            
            // 2 - Create a urlSession
            let session = URLSession(configuration: .default)
            
            // 3 - Give a task to urlSession
            let task = session.dataTask(with: url) { data, response, error in
                if(error != nil){
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    self.parseJSON(data: safeData)
                }
            }
            
            // 4 - Start the task
            task.resume()
        }
    }
    
    func parseJSON(data: Data){
        let decoder = JSONDecoder()

        do{
            let decodedData = try decoder.decode(CoinData.self, from: data)
            print(decodedData.rate)

        }
        catch{
            print(error)
            
        }
    }
    
}

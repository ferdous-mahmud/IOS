//
//  TipBrain.swift
//  Tipsy
//
//  Created by Ferdous Mahmud Akash on 9/13/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

struct TipBrain {
    var bill: Float? = 100
    var tip: Float = 0
    var split: Float = 2
    var result: Float?
    
    
    // Set Bill
    mutating func setBill(billText: String){
        // Convert String to Float
        let numberFormatter = NumberFormatter()
        let number = numberFormatter.number(from: billText)
        bill = number?.floatValue
    }
    
    // Set Tip
    mutating func setTip(tipText: String){
        // Convert String to char and access index 0
        let index = tipText.index(tipText.startIndex, offsetBy: 0)
        let tipTxt = tipText[index]
        
        // Convert char to Int
        if let number = Float(String(tipTxt)) {
            tip = number * 10
        }
    }
    
    // Set Split
    mutating func setSplit(spliter: Float){
        split = spliter
    }
    
    // Get Result
    mutating func getResult() -> Float{
        // Calculation Result
        let percentage = bill! / 100.0
        tip = percentage * tip
        result = (bill! + tip) / split
        
        return result!
    }
    
    
}

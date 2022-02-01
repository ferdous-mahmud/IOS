//
//  CalculatorLogic.swift
//  Calculator Layout iOS13
//
//  Created by Ferdous Mahmud Akash on 2/1/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic{
    
    var number: Double
    
    init(number: Double){
        self.number = number
    }
    
    func calculate(symble: String) -> Double? {
        
        switch symble{
            case "=" :
                print("\(symble) pressed")
            case "C" :
                return 0
            case "+/-" :
                return number * -1
            case "%" :
                return number * 0.01
            case "÷" :
                print("\(symble) pressed")
            case "×" :
                print("\(symble) pressed")
            case "-" :
                print("\(symble) pressed")
            case "+" :
                print("\(symble) pressed")
            default:
                print("defalut")
        }
        
        return nil
    }
    
}

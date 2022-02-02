//
//  CalculatorLogic.swift
//  Calculator Layout iOS13
//
//  Created by Ferdous Mahmud Akash on 2/1/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic{
    
    private var number: Double?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    func calculate(symble: String) -> Double? {
        
        if let n = number {
        switch symble{
            case "=" :
                print("\(symble) pressed")
            case "C" :
                return 0
            case "+/-" :
                return n * -1
            case "%" :
                return n * 0.01
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
        }
        return nil
    }
}

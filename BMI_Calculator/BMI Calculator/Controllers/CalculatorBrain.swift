//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Ferdous Mahmud Akash on 9/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    // Calculate BMI
    mutating func calculateBmi(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue <= 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat More Food", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }
        else if bmiValue <= 24.9{
            bmi = BMI(value: bmiValue, advice: "Great! You are fit", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        }
        else{
            bmi = BMI(value: bmiValue, advice: "Please control your dite", color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        }
    }
    
    // Return BMI
    func getBmiValue() -> String {
        // checking nil value with optional chaining
        return String(format:"%.1f", bmi?.value ?? "Error! BMI value are nil")
    }
    
    // Return Advice
    func getAdvice() -> String {
        // checking nil value
        return bmi?.advice ?? "Error! No Advice Value"
    }
    
    // Reuturn Color
    func getColor() -> UIColor{
        return bmi?.color ?? .green
    }
    
    
}

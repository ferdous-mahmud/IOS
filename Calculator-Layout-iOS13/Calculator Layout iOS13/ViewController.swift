//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLable: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get{
            guard let doubleValue = Double(displayLable.text!) else {
                fatalError("Error! can't convert displayLable text into a Double")
            }
            return doubleValue
        }
        set{
            displayLable.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        if let calcValue = sender.currentTitle {
                switch calcValue{
                    case "=" :
                        print("\(calcValue) pressed")
                    case "C" :
                        displayLable.text = "0"
                    case "+/-" :
                        displayValue *= -1
                    case "%" :
                        displayValue *= 0.01
                    case "÷" :
                        print("\(calcValue) pressed")
                    case "×" :
                        print("\(calcValue) pressed")
                    case "-" :
                        print("\(calcValue) pressed")
                    case "+" :
                        print("\(calcValue) pressed")
                    default:
                        print("defalut")
                }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLable.text = numValue
                isFinishedTypingNumber = false
            }
            else{
                
                if sender.currentTitle == "." {
                    if displayValue != floor(displayValue) {
                        return
                    }
                }
                
                let previousValue = displayLable.text!
                displayLable.text = previousValue  + numValue
            }
        }
    }
    
}


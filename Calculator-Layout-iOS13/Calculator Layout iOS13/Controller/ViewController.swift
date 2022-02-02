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
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        
        if let calcValue = sender.currentTitle {
            guard let calculatedValue = calculator.calculate(symble: calcValue) else {
                fatalError("Error! calculation result are nil")
            }
            displayValue = calculatedValue
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


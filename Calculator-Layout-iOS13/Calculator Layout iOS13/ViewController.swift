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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        if let calcValue = sender.currentTitle {
            if let currentDisplayLable = displayLable.text{
                
                guard let doubledLableText = Double(currentDisplayLable) else {
                    fatalError("Error! can't convert displayLable text into a Double")
                }
                
                switch calcValue{
                    case "=" :
                        print("\(calcValue) pressed")
                    case "C" :
                        displayLable.text = ""
                    case "+/-" :
                        if(doubledLableText >= 0){
                            displayLable.text = "-" + currentDisplayLable
                        }
                        else{
                            displayLable.text = String(currentDisplayLable.dropFirst(1))
                        }
                    case "%" :
                            displayLable.text = String(doubledLableText / Double(100))
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
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLable.text = numValue
                isFinishedTypingNumber = false
            }
            else{
                let previousValue = displayLable.text!
                displayLable.text = previousValue  + numValue
            }
        }
    }
    
}


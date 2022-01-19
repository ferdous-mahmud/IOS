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
    
    var isFinishedTypingNumber: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        if let calcValue = sender.currentTitle {
            switch calcValue{
                case "=" :
                    print("= pressed")
                
                
                default:
                    print("default")
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


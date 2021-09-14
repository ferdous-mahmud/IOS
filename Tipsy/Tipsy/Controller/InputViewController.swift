//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    var tipBrain = TipBrain()
    
    // Keep track of previous selectd tip button
    
    var previousButton: UIButton?
    var tipResult: String = "50.00"

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var stepperNumber: UILabel!
    @IBOutlet weak var inputedBIlTotal: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Percentage Button Pressed
    @IBAction func percentButtonPressed(_ sender: UIButton) {
        
        // Set Previous button
        previousButton?.isSelected = false
        
        // Inputed Bill
        tipBrain.setBill(billText: inputedBIlTotal.text ?? "100")
        
        // Tip Percentege
        tipBrain.setTip(tipText: sender.currentTitle ?? "10%")
        
        // Hiding Keyboard
        inputedBIlTotal.resignFirstResponder()
        
        // change background color
        sender.isSelected = true
        previousButton = sender
        
        // change calculate button BG color
        calculateButton.backgroundColor = #colorLiteral(red: 0.217213124, green: 0.6615546942, blue: 0.4058790803, alpha: 1)
    }
    
    // Stepper Button Pressed
    @IBAction func stepperButtonPressed(_ sender: UIStepper) {
        tipBrain.setSplit(spliter: Float(sender.value))
        stepperNumber.text = String(Int(sender.value))
    }
    
    // Calculate Button pressed
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        tipResult = String(format: "%.2f",tipBrain.getResult())
        performSegue(withIdentifier: "goToResult", sender: self)
        
        // Clear input area & selected item
        inputedBIlTotal.text = ""
        previousButton?.isSelected = false
        stepperNumber.text = "2"
        stepper.value = 2
    }
    
    // Segue sender destination
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        
        destinationVC.tipText = tipResult
        destinationVC.inWord = "Split between \(tipBrain.split) people, with \(Int(tipBrain.getTipPercentage()))% tip"
    }
    
}


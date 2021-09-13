//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tipBrain = TipBrain()
    
    // Keep track of previous selectd tip button
    var previousButton: UIButton?

    @IBOutlet weak var stepperNumber: UILabel!
    @IBOutlet weak var inputedBIlTotal: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
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
    }
    
    // Stepper Button Pressed
    @IBAction func stepperButtonPressed(_ sender: UIStepper) {
        tipBrain.setSplit(spliter: Float(sender.value))
        stepperNumber.text = String(Int(sender.value))
    }
    
    // Calculate Button pressed
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        print(tipBrain.getResult())
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    // Segue sender destination
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        
    }
    
    
    
    // Update UI
    func updateUI(){
        
    }

}


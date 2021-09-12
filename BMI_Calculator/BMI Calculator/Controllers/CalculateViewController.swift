//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    // Slider
    @IBOutlet weak var sliderHeight: UISlider!
    @IBOutlet weak var sliderWeight: UISlider!
    // Lable
    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var weightLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateUI()
        
    }

    // Height
    @IBAction func heightSliderSlide(_ sender: UISlider) {
        let height = String(format:"%.2f", sender.value)
        heightLable.text = "\(height)m"
    }
    // Weight
    @IBAction func weithtSliderSlide(_ sender: UISlider) {
        let weight = Int(sender.value)
        weightLable.text = "\(weight)Kg"
    }
    
    // Calculate
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        // Calculate BMI
        calculatorBrain.calculateBmi(height: sliderHeight.value, weight: sliderWeight.value)
            
        // Goto Result page
        performSegue(withIdentifier: "goToResult", sender: self)
    
    }
    
    // Segue sender destination
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        destinationVC.bmiValue = calculatorBrain.getBmiValue()
        destinationVC.adviceText = calculatorBrain.getAdvice()
        destinationVC.backgroundColor = calculatorBrain.getColor()
    }
    
    // UI update
    func updateUI(){
        sliderHeight.value = 1.50
        sliderWeight.value = 50
        
    }
    
}


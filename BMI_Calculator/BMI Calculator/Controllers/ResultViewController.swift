//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Ferdous Mahmud Akash on 9/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var bmiValue: String?
    var adviceText: String?
    var backgroundColor: UIColor?
    
    @IBOutlet weak var bmiLable: UILabel!
    @IBOutlet weak var adviceLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // Recalculate
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // Update UI
    func updateUI(){
        bmiLable.text = bmiValue
        adviceLable.text = adviceText
        self.view.backgroundColor = backgroundColor
    }


}

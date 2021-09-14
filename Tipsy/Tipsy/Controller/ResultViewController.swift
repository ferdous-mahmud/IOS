//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Ferdous Mahmud Akash on 9/14/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var calculatedTip: UILabel!
    @IBOutlet weak var tipInWord: UILabel!
    
    var tipText: String = "55.00"
    var inWord: String = "Split between 2 people with 10% tip"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    

    @IBAction func reCalculateButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateUI(){
        calculatedTip.text = tipText
        tipInWord.text = inWord
    }

}

//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

// UITextFieldDelegate for go button from keyboard
class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextFild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // call own delegate
        searchTextFild.delegate = self
    }

    // Search Button pressed
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        if checkNil(textField: searchTextFild){
            print(searchTextFild.text!)
            // Hide keyboard
            searchTextFild.endEditing(true)
        }
        else{
            searchTextFild.placeholder = "Please input city name.."
        }
    }
    
    // Go button pressed func
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if checkNil(textField: textField){
            print(searchTextFild.text!)
            // Hide keyboard
            searchTextFild.endEditing(true)
            return true
        }
        else{
            searchTextFild.placeholder = "Please input city name.."
        }
        return false
    }
    
    // Editing end or not
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return checkNil(textField: textField)
    }
    
    // Clear text Fields String
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.placeholder = "Search"
        textField.text = ""
    }
    
    // Check have value nil or not
    func checkNil(textField: UITextField) -> Bool{
        if textField.text != "" {
            return true
        }
        else{
            textField.placeholder = "Please input city name.."
            return false
        }
    }
    
    
    
}


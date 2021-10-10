//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CoinViewController: UIViewController{
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var bitCoinLabel: UILabel!
    @IBOutlet weak var currencyPiker: UIPickerView!
    
    var coinManager = CoinManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPiker.dataSource = self
        currencyPiker.delegate   = self
        coinManager.delegate     = self
    }
}

//MARK: - UIPickerViewDataSource

extension CoinViewController: UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        coinManager.currencyArray.count
    }
}

//MARK: - UIPickerViewDelegate

extension CoinViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.fetchCurrency(currencyName: coinManager.currencyArray[row])
    }
}

//MARK: - CoinManagerDelegate

extension CoinViewController: CoinManagerDelegate{
    
    func didUpdatePrice(price: Double, currency: String) {
        DispatchQueue.main.async {
            self.bitCoinLabel.text  = String(format: "%.1f",price)
            self.currencyLabel.text = currency
        }
    }
}


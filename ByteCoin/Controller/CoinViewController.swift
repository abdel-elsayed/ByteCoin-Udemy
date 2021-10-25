//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Lottie

class CoinViewController: UIViewController {
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var ETHLabel: UILabel!
    @IBOutlet weak var LTCLabel: UILabel!
    
    @IBOutlet weak var animationView: AnimationView!
    
    @IBOutlet var coinCurr: [UILabel]!
    
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Set animation content mode
        animationView.contentMode = .scaleAspectFit
        // 2. Set animation loop mode
        animationView.loopMode = .loop
        // 3. Adjust animation speed
        animationView.animationSpeed = 0.5
        // 4. Play animation
        animationView.play()
        
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        coinManager.delegate = self
    }
}

//MARK: - UIPickerViewDataSource Header
extension CoinViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        for label in coinCurr {
            label.text = coinManager.currencyArray[row]
        }
        coinManager.getCoinPrice(for: coinManager.currencyArray[row])
    }
}

//MARK: - CoinManagerDelegate Header
extension CoinViewController: CoinManagerDelegate {
    
    func didCoinPriceChange(CoinModel: CoinModel) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(format: "%.3f", CoinModel.BTCrate)
            self.ETHLabel.text = String(format: "%.3f", CoinModel.ETHrate)
            self.LTCLabel.text = String(format: "%.3f", CoinModel.LTCrate)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

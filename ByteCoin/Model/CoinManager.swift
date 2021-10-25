//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didCoinPriceChange(CoinModel: CoinModel)
    func didFailWithError(error: Error)
}


struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/"
    let apiKey = ProcessInfo.processInfo.environment["apiKey"]!
    
    var delegate: CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice (for currency: String) {
        let fullURL = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(from: currency, Url: fullURL)
    }
    
    
    func performRequest(from currency: String, Url: String){
        if let url = URL(string: Url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let errorHappened = error {
                    print(errorHappened)
                    return
                }
                if let safeData = data {
                    if let price = parseJSON(data: safeData)
                    {
                        delegate?.didCoinPriceChange(CoinModel: price)
                    }
                }
            }
            task.resume()
        }
        
    }
    
    // !!! NEEDS WORKING ON GETTING THE LTC AND ETH INFO FROM THE SAME API CALL. !!!
    func parseJSON(data: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let coin = CoinModel(currency: decodedData.asset_id_base, coinArr: decodedData.rates)
            return coin
        }
        catch {
            return nil
        }
    }
}

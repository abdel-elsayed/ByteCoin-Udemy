//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = ProcessInfo.processInfo.environment["apiKey"]!
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice (for currency: String) {
        
        performRequest(from: currency)
    }
    
    func performRequest(from currency: String){
        let fullURL = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        if let url = URL(string: fullURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error)
                    return
                }
                if let safeData = data {
                    let price = parseJSON(data: safeData)
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
            print(decodedData.rate)
            
            // RETURN COINMODEL TO BE USED
            return nil 
        }
        catch {
            return nil
        }
    }
}

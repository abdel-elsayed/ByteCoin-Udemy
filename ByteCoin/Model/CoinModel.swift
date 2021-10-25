//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Abdelrahman Elsayed on 10/24/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel: Codable {
    var time: String
    var currency: String
    var BTCrate: Float
    var LTCrate: Float
    var ETHrate: Float
    
    //getting the LTC and ETH from the same API Call -- !!!NEEDS WORK!!!
    func getLTC(CoinData: CoinData) -> Float {
        for item in CoinData.src_side_base{
            if (item.asset == "LTC"){
                return item.rate}
        }
    }
    
    func getETH(CoinData: CoinData) -> Float {
        for item in CoinData.src_side_base{
            if (item.asset == "ETH"){
                return item.rate}
        }
    }
    
}

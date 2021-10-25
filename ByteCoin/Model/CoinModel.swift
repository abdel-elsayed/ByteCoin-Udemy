//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Abdelrahman Elsayed on 10/24/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel: Codable {
//    var time: String
    var currency: String
//    var rate: Float
    let coinArr: [rates]
    
    var BTCrate: Float {
        let BTC = self.coinArr.first { $0.asset_id_quote == "BTC" }
        if let BTCrate = BTC?.rate {
          //  print("The array", coinArr)
           let rateReversed = Float(1)/BTCrate
            return rateReversed
        }
        return -1.0
    }
    
    var LTCrate: Float {
        let LTC = self.coinArr.first { $0.asset_id_quote == "LTC" }
        if let LTCrate = LTC?.rate {
          //  print("The array", coinArr)
            let rateReversed = Float(1)/LTCrate
             return rateReversed
        }
        return -1.0
    }
    
    var ETHrate: Float {
        let ETH = self.coinArr.first { $0.asset_id_quote == "ETH" }
        if let ETHrate = ETH?.rate {
            let rateReversed = Float(1)/ETHrate
             return rateReversed
        }
        return -1.0
    }
    
//    var ETHrate: Float
//
    //getting the LTC and ETH from the same API Call
    //    func getLTC(CoinData: CoinData) -> Float {
    //        for item in CoinData.src_side_base{
    //            if (item.asset == "LTC"){
    //                return item.rate}
    //        }
    //    }
    //
    //    func getETH(CoinData: CoinData) -> Float {
    //        for item in CoinData.src_side_base{
    //            if (item.asset == "ETH"){
    //                return item.rate}
    //        }
    //    }
    
}

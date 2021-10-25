//
//  coinModel.swift
//  ByteCoin
//
//  Created by Abdelrahman Elsayed on 10/24/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let asset_id_base: String // USD
    let rates: [rates]
}

struct rates: Codable {
    let time: String
    let asset_id_quote: String
    let rate: Float
}

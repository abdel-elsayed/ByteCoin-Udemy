//
//  coinModel.swift
//  ByteCoin
//
//  Created by Abdelrahman Elsayed on 10/24/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let time: String
    let asset_id_base: String // BTC
    let asset_id_quote: String // USD
    let rate: Float
    let src_side_base: [src_side_base]
}

struct src_side_base: Codable{
    let asset: String
    let rate: Float
}

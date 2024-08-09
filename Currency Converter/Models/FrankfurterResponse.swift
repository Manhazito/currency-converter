//
//  FrankfurterResponse.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 08/08/2024.
//

import Foundation

struct FrankfurterResponse: Codable {
    let amount: Double
    let base: CoinCode
    let rates: [String: Double]
}

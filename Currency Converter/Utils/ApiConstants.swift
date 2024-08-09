//
//  ApiConstants.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 08/08/2024.
//

import Foundation

enum ApiConstants {
    
    static let baseUrl = "https://api.frankfurter.app"
    
    static let lattestRatesUrl = baseUrl + "/latest"
    
    static func conversionUrl(value: String, from: String, to: String) -> String {
        lattestRatesUrl + "?amount=\(value)&from=\(from)&to=\(to)"
    }
    
}

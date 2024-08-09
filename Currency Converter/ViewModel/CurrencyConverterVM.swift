//
//  CurrencyConverterVM.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 08/08/2024.
//

import SwiftUI
import Observation

@Observable
class CurrencyConverterVM {
    @ObservationIgnored
    private var service: FrankfurterService
    
    var mainCoin: CoinCode = .EUR
    var mainCoinValue: Double = 1.0
    var rates: [CoinCode: Double] = [:]
    var coins = CoinCode.allCases.sorted { $0.name.lowercased() > $1.name.lowercased() }
    
    var amount: String = "" {
        didSet {
            resultError = false
            result = nil
        }
    }
    var fromCoin: CoinCode = .EUR {
        didSet {
            resultError = false
            result = nil
        }
    }
    var toCoin: CoinCode = .USD {
        didSet {
            resultError = false
            result = nil
        }
    }
    var result: Double?
    var resultCurrency: String?
    var resultError: Bool = false {
        didSet {
            if resultError { result = nil }
        }
    }
    
    var loading = false
    var canConvert: Bool {
        Double(amount) != nil
    }
    
    init(service: FrankfurterService) {
        self.service = service
    }
    
    func getTransaction() -> Transaction? {
        guard let value = Double(amount) else { return nil }
        let from = fromCoin.rawValue
        let to = toCoin.rawValue
        
        return Transaction(from: from, to: to, value: value)
    }
    
    @MainActor
    func loadRates() async {
        do {
            loading = true
            defer { loading = false }
            let response = try await service.fetchRates()
            self.rates = translateToCoinCodeKeys(response.rates)
            self.mainCoin = response.base
            self.mainCoinValue = response.amount
        } catch {
            let error = error as? NetworkError ?? .unknownError
            print("Error fetching data: \(error)")
        }
    }
    
    @MainActor
    func convert() async {
        do {
            loading = true
            defer { loading = false }
            let response = try await service.convert(amount, from: fromCoin.rawValue, to: toCoin.rawValue)
            let rate = translateToCoinCodeKeys(response.rates)
            self.result = rate.first?.value
            self.resultCurrency = rate.first?.key.rawValue
        } catch {
            let error = error as? NetworkError ?? .unknownError
            resultError = true
            print("Error fetching data: \(error)")
        }
    }
    
    func translateToCoinCodeKeys(_ original: [String: Double]) -> [CoinCode: Double] {
        original.reduce(into: [CoinCode: Double]()) { result, item in
            let (key, value) = item
            if let coinCode = CoinCode(rawValue: key) {
                result[coinCode] = value
            }
        }

    }
}

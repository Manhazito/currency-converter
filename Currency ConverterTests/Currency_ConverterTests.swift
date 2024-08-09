//
//  Currency_ConverterTests.swift
//  Currency ConverterTests
//
//  Created by Filipe Ramos on 08/08/2024.
//

import XCTest
@testable import Currency_Converter

final class Currency_ConverterTests: XCTestCase {
    var vm: CurrencyConverterVM?
    
    override func setUpWithError() throws {
        self.vm = CurrencyConverterVM(service: FrankfurterService())
    }
    
    func testValidTransaction() throws {
        vm?.amount = "23.23"
        
        let transaction = vm?.getTransaction()
        
        XCTAssert(transaction?.value == 23.23)
    }
    
    func testInvalidTransaction() throws {
        vm?.amount = "S3.23"
        
        let transaction = vm?.getTransaction()
        
        XCTAssert(transaction == nil)
    }
    
    func testValidCoinCodeKeysTransation() {
        let original: [String: Double] = [
            "EUR": 12.12,
            "USD": 12.12,
            "GBP": 12.12
        ]
        
        let final = vm?.translateToCoinCodeKeys(original)
        
        XCTAssert(original.count == final?.count)
    }
    
    func testInvalidCoinCodeKeysTransation() {
        let original: [String: Double] = [
            "XXX": 12.12,
            "USD": 12.12,
            "GBP": 12.12
        ]
        
        let final = vm?.translateToCoinCodeKeys(original)
        
        XCTAssert(original.count == (final?.count ?? -1) + 1)
    }
}

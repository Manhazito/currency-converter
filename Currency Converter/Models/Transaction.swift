//
//  Transaction.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 09/08/2024.
//

import Foundation
import SwiftData

@Model
final class Transaction: Hashable, Identifiable {
    let id: String = UUID().uuidString
    let from: String
    let to: String
    let value: Double
    
    init(from: String, to: String, value: Double) {
        self.from = from
        self.to = to
        self.value = value
    }
}

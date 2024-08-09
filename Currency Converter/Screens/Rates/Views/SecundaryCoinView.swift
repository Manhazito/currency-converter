//
//  SecundaryCoinView.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 09/08/2024.
//

import SwiftUI

struct SecundaryCoinView: View {
    var coin: CoinCode
    var value: Double
    
    var body: some View {
        HStack {
            Image(coin.rawValue)
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .shadow(radius: 3)
                .padding(.trailing, 6)
            
            Text(value, format: .currency(code: coin.rawValue)).font(.title3)
            Text("(\(coin.name))")
        }
        .frame(height: 40)
    }
}

#Preview {
    SecundaryCoinView(coin: .USD, value: 2.25)
}

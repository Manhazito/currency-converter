//
//  CoinLabel.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 08/08/2024.
//

import SwiftUI

struct CoinLabel: View {
    var coin: CoinCode
    
    var body: some View {
        HStack {
            Image(coin.rawValue)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .shadow(radius: 4)
                .padding(.trailing, 8)
            
            Text("\(coin.name) (\(coin.rawValue))")
        }
    }
}

#Preview {
    CoinLabel(coin: .EUR)
}

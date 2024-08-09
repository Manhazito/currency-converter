//
//  MainCoinView.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 09/08/2024.
//

import SwiftUI

struct MainCoinView: View {
    var coin: CoinCode
    var value: Double
    
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            HStack {
                Image(coin.rawValue)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .shadow(radius: 4)
                    .padding(.trailing, 8)
                
                Text(value, format: .currency(code: coin.rawValue)).font(.title)
            }

            Text("converts to:")
                .font(.title3)
                .padding(.leading, 2)
        }
    }
}

#Preview {
    MainCoinView(coin: .USD, value: 2.25)
}

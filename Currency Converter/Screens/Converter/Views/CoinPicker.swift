//
//  CoinPicker.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 08/08/2024.
//

import SwiftUI

struct CoinPicker: View {
    @Binding var selected: CoinCode
    var coins: [CoinCode]
    var label: String
    
    var body: some View {
        VStack {
            Text(label).font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            Menu {
                Picker("FromPicker", selection: $selected) {
                    ForEach(coins, id: \.self) { coin in
                        CoinLabel(coin: coin)
                    }
                }
            } label: {
                HStack {
                    CoinLabel(coin: selected)
                    Spacer()
                    Image(systemName: "arrowtriangle.down.fill")
                }
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1))
            .tint(Color(.label))
        }
    }
}

#Preview {
    CoinPicker(selected: .constant(.EUR), coins: [.EUR, .USD], label: "From:")
}

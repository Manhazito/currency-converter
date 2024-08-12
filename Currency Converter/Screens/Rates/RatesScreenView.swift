//
//  RatesScreenView.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 08/08/2024.
//

import SwiftUI

struct RatesScreenView: View {
    
    @Environment(CurrencyConverterVM.self) private var vm
    
    @State private var test: [CoinCode: Double] = [CoinCode.USD: 0.23]
    @State private var searchText = ""
    
    private var filteredRates: [CoinCode: Double] {
        searchText.isEmpty ? vm.rates : vm.rates.filter { $0.key.name.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        @Bindable var vm = vm
        
        NavigationStack {
            VStack(spacing: 0) {
                if vm.loading {
                    ActivityIndicatorView(style: .large, tint: .accent)
                } else {
                    HStack {
                        MainCoinView(coin: vm.mainCoin, value: vm.mainCoinValue)
                        Spacer()
                    }
                    .padding()
                    
                    Color(.label).opacity(0.5).frame(height: 1)
                    
                    ScrollView {
                        LazyVStack {
                            ForEach(Array(filteredRates.keys), id: \.self) { key in
                                SecundaryCoinView(coin: key, value: vm.rates[key] ?? 0.0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.vertical, 5)
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                    .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
                }
            }
            .navigationTitle("Lattest Rates")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    let vm = CurrencyConverterVM(service: FrankfurterService())
    return RatesScreenView()
        .environment(vm)
        .task {
            await vm.loadRates()
        }
}

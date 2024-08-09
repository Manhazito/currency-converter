//
//  MainTabView.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 08/08/2024.
//

import SwiftUI

struct MainTabView: View {
    private var vm = CurrencyConverterVM(service: FrankfurterService())
    
    var body: some View {
        TabView {
            RatesScreenView()
                .tabItem { Label("Rates", systemImage: "bolt.horizontal") }
                .tag("0")

            ConverterScreenView()
                .tabItem { Label("Converter", systemImage: "eurosign.arrow.circlepath") }
                .tag("1")
        }
        .tint(.accent)
        .environment(vm)
        .task {
            await vm.loadRates()
        }
    }
}

#Preview {
    MainTabView()
}

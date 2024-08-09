//
//  ConverterScreenView.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 08/08/2024.
//

import SwiftUI
import SwiftData

struct ConverterScreenView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var transactions: [Transaction]

    @Environment(CurrencyConverterVM.self) private var vm
    @State private var selectedTransaction: Transaction?
    @FocusState private var isFocused: Bool
        
    var recentTransactions: [Transaction] {
        Array(transactions.reversed().prefix(5))
    }
    
    var body: some View {
        @Bindable var vm = vm
        
        NavigationStack {
            ScrollView {
                AmountField(amount: $vm.amount, focused: $isFocused)
                    .padding(.bottom)
                
                CoinPicker(selected: $vm.fromCoin, coins: vm.coins, label: "From:")
                    .padding(.vertical, 24)
                
                CoinPicker(selected: $vm.toCoin, coins: vm.coins, label: "To:")
                
                LoaderButton(loading: $vm.loading, enabled: vm.canConvert) {
                    Task {
                        isFocused = false
                        await vm.convert()
                        saveTransaction()
                    }
                }
                .padding()
                
                if vm.resultError {
                    Text("Conversion not available…").font(.title3)
                        .padding().padding(.horizontal, 5)
                        .overlay(RoundedRectangle(cornerRadius: 6).fill(.red.opacity(0.1)))
                } else if let result = vm.result,
                          let amount = Double(vm.amount),
                          let resultCurrency = vm.resultCurrency {
                    HStack {
                        Text(amount, format: .currency(code: vm.mainCoin.rawValue)).font(.title)
                            .lineLimit(1)
                        Text("=")
                        Text(result, format: .currency(code: resultCurrency)).font(.title)
                            .lineLimit(1)
                    }
                    .minimumScaleFactor(0.1)
                    .frame(maxWidth: .infinity)
                    .padding().padding([.horizontal, .top], 5)
                    .overlay(RoundedRectangle(cornerRadius: 6).fill(.accent.opacity(0.1)))
                }
                
                Spacer()
            }
            .padding()
            .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
            .scrollIndicators(.hidden)
            .onTapGesture {
                isFocused = false
            }
            .navigationTitle("Converter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if !recentTransactions.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            Picker("History", selection: $selectedTransaction) {
                                ForEach(recentTransactions, id: \.id) { transaction in
                                    HStack {
                                        Text("\(transaction.value.formatted(.currency(code: transaction.from))) to \(transaction.to)")
                                    }
                                    .foregroundStyle(Color(.label))
                                }
                            }
                        } label: {
                            Image(systemName: "slider.horizontal.2.gobackward")
                        }
                    }
                }
            }
        }
    }
    
    private func saveTransaction() {
        guard let transaction = vm.getTransaction() else { return }
        modelContext.insert(transaction)
    }
}

#Preview {
    ConverterScreenView()
        .environment(CurrencyConverterVM(service: FrankfurterService()))
        .modelContainer(for: Transaction.self, inMemory: true)

}

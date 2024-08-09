//
//  AmountField.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 08/08/2024.
//

import SwiftUI

struct AmountField: View {
    @Binding var amount: String
    var focused: FocusState<Bool>.Binding
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Amount").font(.title2)
            HStack {
                TextField("Amount", text: $amount)
                    .focused(focused)
                    .keyboardType(.decimalPad)
                    .padding()
                    .cornerRadius(6)
                    .padding(3)
                    .foregroundColor(Color(.label))
                    .background(.accent.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(.black, lineWidth: 1))
                    .shadow(radius: 4)
            }
        }
    }
}

#Preview {
    return AmountField(amount: .constant(""), focused: FocusState<Bool>().projectedValue)
}

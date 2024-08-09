//
//  LoaderButton.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 09/08/2024.
//

import SwiftUI
import RamosBasicsLibrary

struct LoaderButton: View {
    @Binding var loading: Bool
    var enabled: Bool
    var action: (() async -> Void)
    
    var body: some View {
        Button {
            if loading { return }
            withAnimation { loading = true }
            Task { await action() }
        } label: {
            if loading {
                ActivityIndicatorView(style: .medium, tint: .accent)
                    .frame(width: 180, height: 40)
            } else {
                Text("Convert").frame(width: 180, height: 40)
            }
        }
        .buttonStyle(.bordered)
        .tint(.accent)
        .disabled(!enabled)
    }
}

#Preview {
    LoaderButton(loading:.constant(false), enabled: true) { }
}

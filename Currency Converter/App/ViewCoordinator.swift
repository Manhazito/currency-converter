//
//  ViewCoordinator.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 09/08/2024.
//

import SwiftUI

struct ViewCoordinator: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            MainTabView()
        } else {
            SplashScreenView(isActive: $isActive)
        }
    }
}

#Preview {
    ViewCoordinator()
}

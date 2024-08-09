//
//  SplashScreenView.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 09/08/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isActive: Bool

    @State private var scale = 0.7
    
    var body: some View {
        VStack {
            VStack {
                Image(.logo)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .padding()
                    .shadow(color: Color(.systemBackground), radius: 4)
                
                Text("Currency Converter")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.label))
                    .shadow(color: Color(.systemBackground), radius: 2)
            }.scaleEffect(scale)
                .onAppear{
                    withAnimation(.easeIn(duration: 0.8)) {
                        self.scale = 1.1
                    }
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.accent.opacity(0.5))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView(isActive: .constant(false))
}

//
//  ActivityIndicatorView.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 12/08/2024.
//

import SwiftUI

import SwiftUI
import UIKit

struct ActivityIndicatorView: UIViewRepresentable {
    let style: Style
    let tint: Color
    
    public init(style: Style, tint: Color) {
        self.style = style
        self.tint = tint
    }
    
    public func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: style.uIKitStyle)
        indicator.color = UIColor(tint)

        return indicator
    }
    
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorView>) {
        uiView.startAnimating()
    }
}

extension ActivityIndicatorView {
    enum Style {
        case medium
        case large
    }
}

fileprivate extension ActivityIndicatorView.Style {
    var uIKitStyle: UIActivityIndicatorView.Style {
        switch self {
        case .medium:
            .medium
        case .large:
            .large
        }
    }
}

//
//  CustomModifiers.swift
//  yugioh-3
//
//  Created by Şahin Karahan on 14.12.2024.
//

import SwiftUI

struct StandartButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

extension View {
    func standartButtonStyle() -> some View {
        self.modifier(StandartButtonStyle())
    }
}

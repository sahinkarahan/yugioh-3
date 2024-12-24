//
//  XDismissButton.swift
//  yugioh-3
//
//  Created by Şahin Karahan on 13.12.2024.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 30,height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .foregroundColor(.brandPrimary)
                .imageScale(.medium)
                .frame(width: 44,height: 44)
        }
    }
}

#Preview {
    XDismissButton()
}

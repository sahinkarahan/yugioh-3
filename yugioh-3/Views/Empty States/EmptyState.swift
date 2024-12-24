//
//  EmptyState.swift
//  yugioh-3
//
//  Created by Şahin Karahan on 14.12.2024.
//

import SwiftUI

struct EmptyState: View {
   
   let imageName: String
   let message: String
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding(.leading, 20)
                    .saturation(0)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
        
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "This is our test message. \nI'm making it a little long for testing.")
}

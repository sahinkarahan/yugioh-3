//
//  FrameworkListCell.swift
//  yugioh-3
//
//  Created by Şahin Karahan on 13.12.2024.
//

import SwiftUI

struct FrameworkListCell: View {
    
    var framework: Framework
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                AsyncImage(url: URL(string: framework.cardImages?.first?.imageUrl ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 65, height: 90, alignment: .center)
                        .cornerRadius(8)
                } placeholder: {
                    Image("cardBackground")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 65, height: 90, alignment: .center)
                        .cornerRadius(8)
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text(framework.name)
                        .font(.title3)
                        .fontWeight(.medium)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if let firstPrice = framework.cardPrices?.first {
                        Text("$\(firstPrice.cardmarketPrice ?? "0.00")")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.leading, 10)
            }
            
            Divider()
                .padding(.vertical, 5)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    FrameworkListCell(framework: MockData.sampleFramework)
        
}



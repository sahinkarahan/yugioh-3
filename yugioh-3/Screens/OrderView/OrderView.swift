//
//  OrderView.swift
//  yugioh-3
//
//  Created by Şahin Karahan on 13.12.2024.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack {
                    List {
                        ForEach(order.items) { framework in
                            FrameworkListCell(framework: framework)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        print("order placed")
                    } label: {
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandartButtonStyle())
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. Please add a card!")
                }
            }
            .navigationTitle("Orders")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    OrderView()
}

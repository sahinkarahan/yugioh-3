//
//  ContentView.swift
//  yugioh-3
//
//  Created by Şahin Karahan on 13.12.2024.
//

import SwiftUI

struct FrameworkTabView: View {
    
    @EnvironmentObject var order : Order
    
    var body: some View {
        
        TabView{
            
            FrameworkListView()
                .tabItem { Label("Card List", systemImage: "square.stack.3d.down.right") }
            
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
            
        }
    }
}

#Preview {
    FrameworkTabView()
}

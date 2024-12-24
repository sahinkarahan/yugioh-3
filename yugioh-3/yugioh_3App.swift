//
//  yugioh_3App.swift
//  yugioh-3
//
//  Created by Şahin Karahan on 13.12.2024.
//

import SwiftUI

@main
struct yugioh_3App: App {
    
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            FrameworkTabView().environmentObject(order)
        }
    }
}

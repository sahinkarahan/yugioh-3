//
//  Order.swift
//  yugioh-3
//
//  Created by Şahin Karahan on 14.12.2024.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Framework] = []
    
    var totalPrice: Double {
        items.reduce(0) { total, item in
            let price = item.cardPrices?.first?.cardmarketPrice ?? "0"
            return total + (Double(price) ?? 0)
        }
    }

    func add(_ framework: Framework) {
        items.append(framework)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
}

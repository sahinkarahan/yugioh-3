//
//  Date+Ext.swift
//  yugioh-3
//
//  Created by Şahin Karahan on 14.12.2024.
//

import Foundation

extension Date {
    
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
    
}

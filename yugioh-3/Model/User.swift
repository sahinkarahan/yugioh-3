//
//  User.swift
//  yugioh-3
//
//  Created by Şahin Karahan on 14.12.2024.
//

import Foundation

struct User: Codable {
    
    var firsTName   = ""
    var lastName    = ""
    var email       = ""
    var birthday    = Date()
    var normalBox   = true
    var metalBox    = false
    var premiumBox  = false
       
}

//
//  Framework.swift
//  yugioh-3
//
//  Created by Şahin Karahan on 13.12.2024.
//

import Foundation

struct Framework: Identifiable, Codable {
    let id: Int
    let name: String
    let type: String
    let attribute: String?
    let race: String?
    let level: Int?
    let atk: Int?
    let def: Int?
    let archtype: String?
    let desc: String
    let cardImages: [CardImage]?
    let cardPrices: [CardPrices]?  // Fiyatları dizi olarak tanımladık

    enum CodingKeys: String, CodingKey {
        case id, name, type, desc, atk, def, level, race, attribute, archtype
        case cardImages = "card_images"
        case cardPrices = "card_prices"
    }
}

struct CardImage: Codable {
    let id: Int
    let imageUrl: String
    let imageUrlSmall: String

    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "image_url"
        case imageUrlSmall = "image_url_small"
    }
}

struct CardPrices: Codable {
    let cardmarketPrice: String?
    let tcgplayerPrice: String?
    let ebayPrice: String?
    let amazonPrice: String?
    let coolstuffincPrice: String?

    enum CodingKeys: String, CodingKey {
        case cardmarketPrice = "cardmarket_price"
        case tcgplayerPrice = "tcgplayer_price"
        case ebayPrice = "ebay_price"
        case amazonPrice = "amazon_price"
        case coolstuffincPrice = "coolstuffinc_price"
    }
}

struct FrameworkResponse: Codable {
    let data: [Framework]
}

struct MockData {
    static let sampleFramework = Framework(
        id: 0001,
        name: "Blue-Eyes White Dragon",
        type: "Monster",
        attribute: "Light",
        race: "Dragon",
        level: 8,
        atk: 3000,
        def: 2500,
        archtype: "Blue-Eyes",
        desc: "This legendary dragon is a powerful engine of destruction.",
        cardImages: [
            CardImage(id: 1, imageUrl: "https://example.com/blueeyes.jpg", imageUrlSmall: "https://example.com/blueeyes_small.jpg")
        ],
        cardPrices: [
            CardPrices(
                cardmarketPrice: "0.50",
                tcgplayerPrice: "0.70",
                ebayPrice: "1.20",
                amazonPrice: "1.00",
                coolstuffincPrice: "0.08"
            )
        ]
    )
    
    
    static let frameworks = [sampleFramework, sampleFramework, sampleFramework, sampleFramework]
    
    
    
    
    
    static let orderItemOne = Framework(
        id: 0001,
        name: "Blue-Eyes One ",
        type: "Monster",
        attribute: "Light",
        race: "Dragon",
        level: 8,
        atk: 3000,
        def: 2500,
        archtype: "Blue-Eyes",
        desc: "This legendary dragon is a powerful engine of destruction.",
        cardImages: [
            CardImage(id: 1, imageUrl: "https://example.com/blueeyes.jpg", imageUrlSmall: "https://example.com/blueeyes_small.jpg")
        ],
        cardPrices: [
            CardPrices(
                cardmarketPrice: "0.50",
                tcgplayerPrice: "0.70",
                ebayPrice: "1.20",
                amazonPrice: "1.00",
                coolstuffincPrice: "0.08"
            )
        ]
    )
    
    static let orderItemTwo = Framework(
        id: 0002,
        name: "Blue-Eyes Two",
        type: "Monster",
        attribute: "Light",
        race: "Dragon",
        level: 8,
        atk: 3000,
        def: 2500,
        archtype: "Blue-Eyes",
        desc: "This legendary dragon is a powerful engine of destruction.",
        cardImages: [
            CardImage(id: 1, imageUrl: "https://example.com/blueeyes.jpg", imageUrlSmall: "https://example.com/blueeyes_small.jpg")
        ],
        cardPrices: [
            CardPrices(
                cardmarketPrice: "0.50",
                tcgplayerPrice: "0.70",
                ebayPrice: "1.20",
                amazonPrice: "1.00",
                coolstuffincPrice: "0.08"
            )
        ]
    )
    
    
    static let orderItemThree = Framework(
        id: 0003,
        name: "Blue-Eyes Three",
        type: "Monster",
        attribute: "Light",
        race: "Dragon",
        level: 8,
        atk: 3000,
        def: 2500,
        archtype: "Blue-Eyes",
        desc: "This legendary dragon is a powerful engine of destruction.",
        cardImages: [
            CardImage(id: 1, imageUrl: "https://example.com/blueeyes.jpg", imageUrlSmall: "https://example.com/blueeyes_small.jpg")
        ],
        cardPrices: [
            CardPrices(
                cardmarketPrice: "0.50",
                tcgplayerPrice: "0.70",
                ebayPrice: "1.20",
                amazonPrice: "1.00",
                coolstuffincPrice: "0.08"
            )
        ]
    )
    
    
    static let orderItems   = [orderItemOne, orderItemTwo, orderItemThree]
    
}


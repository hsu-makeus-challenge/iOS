//
//  PayCard.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 5/29/25.
//

import SwiftUI
import SwiftData

@Model
class PayCard: Identifiable {
    @Attribute(.unique) var id: UUID
    var image: String
    var cardName: String
    var balance: Int
    var cardNumber: String
    
    init(
        image: String,
        cardName: String,
        balance: Int,
        cardNumber: String
    ) {
        self.id = UUID()
        self.image = image
        self.cardName = cardName
        self.balance = balance
        self.cardNumber = cardNumber
    }
    
}

var payCards: [PayCard] = [
    PayCard(image: "payCardImage1", cardName: "아무카드A", balance: 999, cardNumber: "123412341234"),
    PayCard(image: "payCardImage2", cardName: "아무카드B", balance: 12000, cardNumber: "123456789123")
    ]

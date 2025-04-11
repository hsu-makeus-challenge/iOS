//
//  ReceiptModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/10/25.
//

import Foundation
import SwiftData

@Model
class ReceiptModel {
    @Attribute(.unique) var id: UUID
    
    var orderer: String
    var store: String
    var menuItems: [String]
    var totalAmount: Int
    var orderNumber: String
    var orderDate: String
    var createdAt: Date
    
    init(
        orderer: String,
        store: String,
        menuItems: [String],
        totalAmount: Int,
        orderNumber: String,
        orderDate: String,
        createdAt: Date = Date()
    ) {
        self.id = UUID()
        self.orderer = orderer
        self.store = store
        self.menuItems = menuItems
        self.totalAmount = totalAmount
        self.orderNumber = orderNumber
        self.orderDate = orderDate
        self.createdAt = createdAt
    }
}

extension ReceiptModel {
    static let empty = ReceiptModel(
        orderer: "주문자 없음",
        store: "장소 없음",
        menuItems: [],
        totalAmount: 0,
        orderNumber: "주문번호 없음",
        orderDate: "날짜 없음"
    )
}

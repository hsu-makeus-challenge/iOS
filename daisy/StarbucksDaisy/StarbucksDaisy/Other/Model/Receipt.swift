//
//  Receipt.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 4/10/25.
//

import Foundation
import SwiftData

@Model
class Receipt {
    @Attribute(.unique) var id: UUID // 고유 식별자 ( 데이터베이스의 기본키처럼 동작합니다 )
    
    var store: String            // 장소
    var totalAmount: Int         // 결제 금액
    var orderDate: String        // 주문 날짜
    var createdAt: Date          // 저장된 시점
    
    init(
            store: String,
            totalAmount: Int,
            orderDate: String,
            createdAt: Date = Date()
        ) {
            self.id = UUID()
            self.store = store
            self.totalAmount = totalAmount
            self.orderDate = orderDate
            self.createdAt = createdAt
        }
}

extension Receipt {
    static let empty = Receipt(
        store: "장소 없음",
        totalAmount: 0,
        orderDate: "날짜 없음"
    )
}

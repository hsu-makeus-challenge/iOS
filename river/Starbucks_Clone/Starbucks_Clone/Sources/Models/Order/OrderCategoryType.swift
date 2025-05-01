//
//  OrderCategoryType.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/1/25.
//

import Foundation

enum OrderCategoryType: String, CaseIterable, Identifiable {
    case beverage = "음료"
    case food = "푸드"
    case merchandise = "상품"

    var id: Self { self }

    var isNew: Bool {
        switch self {
        case .beverage, .food, .merchandise:
            return true // 현재는 모두 new, 이후 동적으로 관리 가능
        }
    }
}

//
//  OrderTabState.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/1/25.
//

import Foundation

@Observable
final class OrderTabState {
    var selectedSegment: OrderSegmentType = .allMenu
    var selectedCategory: OrderCategoryType = .beverage
}

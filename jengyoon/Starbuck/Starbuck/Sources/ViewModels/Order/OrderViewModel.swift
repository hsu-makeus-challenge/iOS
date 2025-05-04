//
//  OrderViewModel.swift
//  Starbuck
//
//  Created by 송승윤 on 5/4/25.
//
import Foundation

// MARK: - View에 필요한 상태와 비지니스 로직을 관리
final class OrderViewModel: ObservableObject {
    // 현재 선택된 상단 세그먼트 상태 (전체 메뉴/ 나만의 메뉴/ 홈케이크 예약)
    @Published var selectedSegment: OrderSegment = .allMenu
    // 현재 선택된 하단 메뉴 세그먼트 상태 (음료/ 푸드/ 상품)
    @Published var menuSegment: MenuSegment = .drink
    // 전체 커피 메뉴 리스트
    @Published private var allItems: [OrderCoffeeModel] = OrderCoffeeModel.dummyData
    
    
    // 현재 선택된 menuSegment에 따라 필터링된 아이템 리스트 반환
    var filteredItems: [OrderCoffeeModel] {
        switch menuSegment {
        case .drink:
            return allItems.filter { $0.type == .drink }
        case .food:
            return allItems.filter { $0.type == .food }
        case .product:
            return allItems.filter { $0.type == .product }
        }
    }
}

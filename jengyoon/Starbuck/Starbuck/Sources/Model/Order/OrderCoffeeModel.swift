//
//  OrderCoffeeModel.swift
//  Starbuck
//
//  Created by 송승윤 on 5/4/25.
//

import Foundation

// MARK: - 하단 세그먼트 타입 구분용 열거형
enum OrderType {
    case drink, food, product
}

struct OrderCoffeeModel: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
    let type: OrderType
    
    static let dummyData: [OrderCoffeeModel] = [
        .init(name: "추천", description: "Recommend", imageName: "order1", type: .drink),
        .init(name: "아이스 카페 아메리카노", description: "Ice Americano", imageName: "order2", type: .drink),
        .init(name: "카페 아메리카노", description: "Cafe Americano", imageName: "order3", type: .drink),
        .init(name: "카푸치노", description: "cappuccino", imageName: "order4", type: .drink),
        .init(name: "아이스 카푸치노", description: "Ice cappuccino", imageName: "order5", type: .drink),
        .init(name: "카라멜 마키아또", description: "Caramel Machiatto", imageName: "order6", type: .drink),
        .init(name: "아이스 카라멜 마키아또", description: "Ice Caramel Machiatto", imageName: "order7", type: .drink),
        .init(name: "아포가토/기타", description: "Apogatto", imageName: "order8", type: .drink),
        .init(name: "럼 샷 코르타도", description: "Brewed Coffee", imageName: "order9", type: .drink),
        .init(name: "라벤더 카페 브레베", description: "breve Lavender", imageName: "order10", type: .drink),
        .init(name: "병음료", description: "BTD", imageName: "order11", type: .drink)
    ]
}

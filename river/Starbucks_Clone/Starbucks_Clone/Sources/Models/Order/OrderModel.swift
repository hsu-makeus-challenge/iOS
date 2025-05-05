//
//  OrderModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/1/25.
//

import Foundation

struct OrderModel {
    let id = UUID()
    let catetories: [OrderCategory]
}

struct OrderCategory {
    let id = UUID() // TODO: 추후 메뉴 ID로 변경(네비게이션 전달 위해)
    let imageName: String
    let title: String
    let titleEn: String
}

extension OrderModel {
    static let moakData: OrderModel = .init(
        catetories: [
            .init(
                imageName: "Order/Menu/menu1",
                title: "추천",
                titleEn: "Recommend"
            ),
            .init(
                imageName: "Order/Menu/menu2",
                title: "아이스 카페 아메리카노",
                titleEn: "Reserve Expresso"
            ),
            .init(
                imageName: "Order/Menu/menu3",
                title: "카페 아메리카노",
                titleEn: "Recommend"
            ),
            .init(
                imageName: "Order/Menu/menu4",
                title: "카푸치노",
                titleEn: "Recommend"
            ),
            .init(
                imageName: "Order/Menu/menu5",
                title: "아이스 카푸치노",
                titleEn: "Recommend"
            ),
            .init(
                imageName: "Order/Menu/menu6",
                title: "카라멜 마키아또",
                titleEn: "Recommend"
            ),
            .init(
                imageName: "Order/Menu/menu7",
                title: "아이스 카라멜 마키아또",
                titleEn: "Recommend"
            ),
            .init(
                imageName: "Order/Menu/menu8",
                title: "아포카노/기타",
                titleEn: "Recommend"
            ),
            .init(
                imageName: "Order/Menu/menu9",
                title: "럼 샷 코르타도",
                titleEn: "Recommend"
            ),
            .init(
                imageName: "Order/Menu/menu10",
                title: "라벤더 카페 브레베",
                titleEn: "Recommend"
            ),
            .init(
                imageName: "Order/Menu/menu11",
                title: "병음료",
                titleEn: "Recommend"
            )
        ]
    )
        
}

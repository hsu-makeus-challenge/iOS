//
//  HomeModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import Foundation
import SwiftUI

struct HomeModel: Identifiable {
    let id: UUID = UUID()
    let remommendedDrinks: [RecommendedDrink]
    let Dessert: [Dessert]
}

struct RecommendedDrink: Identifiable {
    let id: UUID = UUID()
    let name: String
    let image: String
    
    var imageView: Image {
        Image(image)
    }
}

struct Dessert: Identifiable {
    let id: UUID = UUID()
    let name: String
    let image: String
    
    var imageView: Image {
        Image(image)
    }
}

extension HomeModel {
    static let mockData: HomeModel = .init(
        remommendedDrinks: [
            .init(name: "에소프레소 콘파나", image: "confana"),
            .init(name: "에스프레소 마키아또", image: "macchiato"),
            .init(name: "아이스 아메리카노", image: "iceAmericano"),
            .init(name: "아메리카노", image: "americano"),
            .init(name: "아이스 카페라떼", image: "iceLatte"),
            .init(name: "카페라떼", image: "latte"),
        ],
        Dessert: [
            .init(name: "너티 크루아상", image: "croissant"),
            .init(name: "매콤 소시지 불고기", image: "bulgogi"),
            .init(name: "미니 리프 파이", image: "miniPie"),
            .init(name: "뺑 오 쇼콜라", image: "chocolate"),
            .init(name: "소시지&올리브 파이", image: "olivePIe")
        ]
    )
}

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
    let dessert: [Dessert]
    let newsCards: [NewsCard]
}

struct RecommendedDrink: Identifiable {
    let id: UUID = UUID()
    let name: String
    let image: String
    
    var imageView: Image {
        Image(image)
    }
}

struct NewsCard: Identifiable {
    let id: UUID = UUID()
    let title: String
    let subTitle: String
    let image: String
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
        dessert: [
            .init(name: "너티 크루아상", image: "croissant"),
            .init(name: "매콤 소시지 불고기", image: "bulgogi"),
            .init(name: "미니 리프 파이", image: "miniPie"),
            .init(name: "뺑 오 쇼콜라", image: "chocolate"),
            .init(name: "소시지&올리브 파이", image: "olivePIe")
        ],
        newsCards: [
            .init(
                title: "25년 3월 일회용컵 없는 날 캠페..",
                subTitle: "매월 10일은 일회용컵 없는 날! 스타벅스 에모매장에서 개인컵 및 다회용 컵을 이용하세요.",
                image: "disposableBanner"
            ),
            .init(
                title: "스타벅스 ooo점을 찾습니다",
                subTitle: "스타벅스 커뮤니티 스토어 파트너를 웅영할 기관을 공모합니다.",
                image: "partnerBanner"
            ),
            .init(
                title: "2월 8일, 리저브 스프링 신규 커...",
                subTitle: "산뜻하고 달콤한 풍미가 가득한 리저브를 맛보세요.",
                image: "riserveBanner"
            )
        ]
    )
}

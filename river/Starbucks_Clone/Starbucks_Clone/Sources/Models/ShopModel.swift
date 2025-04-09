//
//  ShopModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/9/25.
//

import Foundation

struct ShopModel {
    struct OnlineStoreBanner: Identifiable {
        let id = UUID()
        let imageName: String
    }

    struct Item: Identifiable {
        let id = UUID()
        let name: String
        let imageName: String
    }
    
    let onlineStoreBanner: [OnlineStoreBanner]
    let allProducts: [Item]
    let bestProducts: [Item]
    let newProducts: [Item]
}

extension ShopModel {
    static let moackData: ShopModel = .init(
        onlineStoreBanner: [
            .init(imageName: "Shop/Store1"),
            .init(imageName: "Shop/Store2"),
            .init(imageName: "Shop/Store3"),
        ],
        allProducts: [
            .init(name: "텀블러", imageName: "Shop/AllProducts/img1"),
            .init(name: "커피 용품", imageName: "Shop/AllProducts/img2"),
            .init(name: "선물세트", imageName: "Shop/AllProducts/img3"),
            .init(name: "보온병", imageName: "Shop/AllProducts/img4"),
            .init(name: "머그컵", imageName: "Shop/AllProducts/img5"),
            .init(name: "라이프스타일", imageName: "Shop/AllProducts/img6"),
        ],
        bestProducts: [
            .init(
                name: "그린 사이렌 슬리브 머그 355ml",
                imageName: "Shop/BestProducts/img1"
            ),
            .init(
                name: "그린 사이렌 클래식 머그 355ml",
                imageName: "Shop/BestProducts/img2"
            ),
            .init(
                name: "사이렌 머그 앤 우드 소서",
                imageName: "Shop/BestProducts/img3"
            ),
            .init(
                name: "리저브 골드 테일 머그 355ml",
                imageName: "Shop/BestProducts/img4"
            ),
            .init(
                name: "블랙 앤 골드 머그 473ml",
                imageName: "Shop/BestProducts/img5"
            ),
            .init(
                name: "블랙 링 머그 355ml",
                imageName: "Shop/BestProducts/img6"
            ),
            .init(
                name: "북청사자놀음 데미머그 89ml",
                imageName: "Shop/BestProducts/img7"
            ),
            .init(
                name: "서울 제주 데미머그 세트",
                imageName: "Shop/BestProducts/img8"
            ),
        ],
        newProducts: [
            .init(
                name: "그린 사이렌 슬리브 머그 355ml",
                imageName: "Shop/NewProducts/img1"
            ),
            .init(
                name: "그린 사이렌 도트 머그 355ml",
                imageName: "Shop/NewProducts/img2"
            ),
            .init(
                name: "홈 카페 미니 머그 세트",
                imageName: "Shop/NewProducts/img3"
            ),
            .init(
                name: "홈 카페 글라스 세트",
                imageName: "Shop/NewProducts/img4"
            )
        ]
    )
}

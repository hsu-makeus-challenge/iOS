//
//  ShopModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/9/25.
//

import Foundation

struct ShopModel {
    let onlineStoreBanner: [OnlineStoreBanner]
}

struct OnlineStoreBanner: Identifiable {
    let id = UUID()
    let imageName: String
}

extension ShopModel {
    static let moackData: ShopModel = .init(
        onlineStoreBanner: [
            .init(imageName: "Shop/Store1"),
            .init(imageName: "Shop/Store2"),
            .init(imageName: "Shop/Store3"),
        ]
    )
}

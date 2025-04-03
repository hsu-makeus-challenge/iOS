//
//  MenuDetailModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import Foundation

struct MenuDetailModel: Identifiable {
    let id: UUID = UUID()
    let menuName: String
    let menuNameEn: String
    let description: String
    let variants: [MenuVariant]
}

struct MenuVariant: Identifiable {
    let id: UUID = UUID()
    let type: TemperatureType
    let imageName: String
    let price: String
}

enum TemperatureType: String, CaseIterable, Identifiable {
    case hot = "HOT"
    case iced = "ICED"
    
    var id: String { self.rawValue }
}

extension MenuDetailModel {
    static let mockData: [MenuDetailModel] = [
        .init(
            menuName: "아이스 카라멜 마끼아또",
            menuNameEn: "Iced Caramel Macchiato",
            description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
            variants: [
                .init(
                    type: .iced,
                    imageName: "caramerlCold",
                    price: "6100"
                )
            ]
        ),
        .init(
            menuName: "카라멜 마끼아또",
            menuNameEn: "Caramel Macchiato",
            description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
            variants: [
                .init(
                    type: .hot,
                    imageName: "caramelHot",
                    price: "6100"
                )
            ]
        ),
        .init(
            menuName: "아이스 카페 아메리카노",
            menuNameEn: "Iced Caffe Americano",
            description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
            variants: [
                .init(
                    type: .iced,
                    imageName: "americanpCold",
                    price: "4700"
                )
            ]
        ),
        .init(
            menuName: "카페 아메리카노",
            menuNameEn: "Caffe Americano",
            description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
            variants: [
                .init(
                    type: .hot,
                    imageName: "americanoHot",
                    price: "4700"
                )
            ]
        ),
        .init(
            menuName: "에스프레소 콘 파나",
            menuNameEn: "Espresso Con Panna",
            description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
            variants: [
                .init(
                    type: .hot,
                    imageName: "confana",
                    price: "4100"
                )
            ]
        ),
        .init(
            menuName: "에스프레소 마끼아또",
            menuNameEn: "Espresso Macchiato",
            description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
            variants: [
                .init(
                    type: .iced,
                    imageName: "macchiato",
                    price: "3900"
                )
            ]
        ),
    ]
}

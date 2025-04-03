//
//  MenuDetailModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import Foundation

struct MenuDetailModel: Identifiable {
    let id: UUID = UUID()
    let variants: [MenuVariant]
}

struct MenuVariant: Identifiable {
    let id: UUID = UUID()
    let type: TemperatureType
    let imageName: String
    let menuName: String
    let menuNameEn: String
    let description: String
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
            variants: [
                .init(
                    type: .iced,
                    imageName: "caramerlCold",
                    menuName: "아이스 카라멜 마끼아또",
                    menuNameEn: "Iced Caramel Macchiato",
                    description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                    price: "6100"
                )
            ]
        ),
        .init(
            variants: [
                .init(
                    type: .hot,
                    imageName: "caramelHot",
                    menuName: "카라멜 마끼아또",
                    menuNameEn: "Caramel Macchiato",
                    description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                    price: "6100"
                )
            ]
        ),
        .init(
            variants: [
                .init(
                    type: .iced,
                    imageName: "americanpCold",
                    menuName: "아이스 카페 아메리카노",
                    menuNameEn: "Iced Caffe Americano",
                    description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                    price: "4700"
                )
            ]
        ),
        .init(
            variants: [
                .init(
                    type: .hot,
                    imageName: "americanoHot",
                    menuName: "카페 아메리카노",
                    menuNameEn: "Caffe Americano",
                    description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                    price: "4700"
                )
            ]
        ),
        .init(
            variants: [
                .init(
                    type: .hot,
                    imageName: "confana",
                    menuName: "에스프레소 콘 파나",
                    menuNameEn: "Espresso Con Panna",
                    description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                    price: "4100"
                )
            ]
        ),
        .init(
            variants: [
                .init(
                    type: .iced,
                    imageName: "macchiato",
                    menuName: "에스프레소 마끼아또",
                    menuNameEn: "Espresso Macchiato",
                    description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                    price: "3900"
                )
            ]
        ),
    ]
}

//
//  MenuDetailModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import Foundation

struct MenuDetailModel: Identifiable {
    let menuID: MenuID
    let menuTemperatureItem: [MenuTemperatureItem]
    
    var id: MenuID { menuID }
    
    /// 현재 메뉴가 지원하는 온도 타입 리스트
    var availableTemperatureTypes: [TemperatureType] {
        menuTemperatureItem.map { $0.temperatureType }
    }
}

struct MenuTemperatureItem: Identifiable, Hashable {
    let menuID: MenuID
    let temperatureType: TemperatureType
    let imageName: String
    let menuName: String
    let menuNameEn: String
    let description: String
    let price: String

    var id: String {
        "\(menuID.rawValue)_\(temperatureType.rawValue)"
    }
}

enum TemperatureType: String, CaseIterable, Identifiable {
    case hot = "HOT"
    case iced = "ICED"
    
    var id: String { self.rawValue }
}

extension MenuDetailModel {
    static let mockData: [MenuDetailModel] = [
        .init(
            menuID: .caramelMacchiato,
            menuTemperatureItem: [
                .init(
                    menuID: .caramelMacchiato,
                    temperatureType: .iced,
                    imageName: "caramerlCold",
                    menuName: "아이스 카라멜 마끼아또",
                    menuNameEn: "Iced Caramel Macchiato",
                    description: "...",
                    price: "6100"
                ),
                .init(
                    menuID: .caramelMacchiato,
                    temperatureType: .hot,
                    imageName: "caramelHot",
                    menuName: "카라멜 마끼아또",
                    menuNameEn: "Caramel Macchiato",
                    description: "...",
                    price: "6100"
                )
            ]
        ),
        .init(
            menuID: .caffeAmericano,
            menuTemperatureItem: [
                .init(
                    menuID: .caffeAmericano,
                    temperatureType: .iced,
                    imageName: "americanpCold",
                    menuName: "아이스 카페 아메리카노",
                    menuNameEn: "Iced Caffe Americano",
                    description: "...",
                    price: "4700"
                ),
                .init(
                    menuID: .caffeAmericano,
                    temperatureType: .hot,
                    imageName: "americanoHot",
                    menuName: "카페 아메리카노",
                    menuNameEn: "Caffe Americano",
                    description: "...",
                    price: "4700"
                )
            ]
        ),
        .init(
            menuID: .espressoConPanna,
            menuTemperatureItem: [
                .init(
                    menuID: .espressoConPanna,
                    temperatureType: .hot,
                    imageName: "confana",
                    menuName: "에스프레소 콘 파나",
                    menuNameEn: "Espresso Con Panna",
                    description: "...",
                    price: "4100"
                )
            ]
        ),
        .init(
            menuID: .espressoMacchiato,
            menuTemperatureItem: [
                .init(
                    menuID: .espressoMacchiato,
                    temperatureType: .iced,
                    imageName: "macchiato",
                    menuName: "에스프레소 마끼아또",
                    menuNameEn: "Espresso Macchiato",
                    description: "...",
                    price: "3900"
                )
            ]
        )
    ]
}

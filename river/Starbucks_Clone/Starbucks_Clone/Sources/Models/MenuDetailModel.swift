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
    
    /// 현재 메뉴가 지원하는 온도 타입 리스트(제 코드 보게 된다면 읽어보길 바랍니당)
    ///
    /// [모델에 정의한 이유]
    /// - 온도 타입은 메뉴의 "속성"에 해당되므로, 뷰가 아닌 메뉴 데이터 자체에 포함되는 것이 의미상 적절
    /// - 해당 정보는 UI 외의 영역(예: 검색 필터, API 요청 등)에서도 활용될 수 있으므로 재사용성을 높이기 위해 모델에 정의
    /// - 모델은 구조체로서 상태 변화 없이 테스트와 관리가 쉬우며, 해당 속성은 데이터에 기반한 "계산 프로퍼티"에 해당하므로 모델에 위치하는 것이 좋음
    ///
    /// [뷰모델에 두는 경우와의 차이]
    /// - 뷰모델에 정의하면, 정렬, 필터링, 텍스트 변환 등 UI 중심의 로직과 함께 사용할 수 있는 장점이 있음.
    /// - 그러나 이 속성은 순수하게 데이터를 기반으로 생성되므로, 뷰모델이 아닌 모델이 소유하는 것이 책임 분리 관점에서 더 바람직하다.
    ///
    /// => 모델이 온도 타입 목록을 소유하고, 뷰모델은 이 데이터를 필요에 따라 가공하거나 바인딩만 담당한다.
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
                    description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                    price: "6100"
                ),
                .init(
                    menuID: .caramelMacchiato,
                    temperatureType: .hot,
                    imageName: "caramelHot",
                    menuName: "카라멜 마끼아또",
                    menuNameEn: "Caramel Macchiato",
                    description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
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
                    description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                    price: "4700"
                ),
                .init(
                    menuID: .caffeAmericano,
                    temperatureType: .hot,
                    imageName: "americanoHot",
                    menuName: "카페 아메리카노",
                    menuNameEn: "Caffe Americano",
                    description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
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
                    description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
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
                    description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                    price: "3900"
                )
            ]
        )
    ]
}

//
//  CoffeeModel.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import Foundation

/// 홈 탭 커피 아이템 모델
struct CoffeeModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let englishName: String
    let imageName: String
    let discription: String
    let price: Int
    let temperatureType: CoffeeTemperatureType
}

enum CoffeeTemperatureType {
    case both // 아이스, 핫 모두 선택 가능
    case icedOnly // 아이스만 가능
    case hotOnly // 핫만 가능
    
    /// 커피 기본 값 설정
    var options: [CoffeeOption] {
        switch self {
        case .both: return [.iced, .hot]
        case .icedOnly: return [.iced]
        case .hotOnly: return [.hot]
        }
    }
    
    /// first 메서드를 활용하기 위해 CoffeeOption타입 옵셔널 처리
    var defalutOption: CoffeeOption? {
        options.first
    }
}

/// .both case로 인한 반복가능한 케이스 프로토콜 채택
enum CoffeeOption: String, CaseIterable, Identifiable {
    case iced = "ICED"
    case hot = "HOT"
    
    var id: String {rawValue}
}

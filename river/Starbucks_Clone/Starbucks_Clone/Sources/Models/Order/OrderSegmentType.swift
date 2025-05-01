//
//  OrderSegmentType.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/1/25.
//

import Foundation

enum OrderSegmentType: Int, CaseIterable, Identifiable {
    case allMenu = 0
    case myMenu = 1
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .allMenu:
            return "전체 메뉴"
        case .myMenu:
            return "나만의 메뉴"
        }
    }
}

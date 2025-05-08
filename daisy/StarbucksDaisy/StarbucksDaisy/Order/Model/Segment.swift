//
//  Segment.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 5/1/25.
//

import Foundation

enum OrderSegment: Int, CaseIterable, Identifiable {
    case first
    case second
    case third
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .first:
            return "전체 메뉴"
        case .second:
            return "나만의 메뉴"
        case .third:
            return "홀케이크 예약"
        }
    }
}

enum MenuSegment: Int, CaseIterable, Identifiable {
    case first
    case second
    case third
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .first:
            return "음료"
        case .second:
            return "푸드"
        case .third:
            return "상품"
        }
    }
}

enum PlaceSegment: Int, CaseIterable, Identifiable {
    case first
    case second
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .first:
            return "가까운 매장"
        case .second:
            return "자주 가는 매장"
        }
    }
}

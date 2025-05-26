//
//  StoreInfoTabState.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/22/25.
//

import Foundation

enum StoreInfoTabState: Int, CaseIterable, Identifiable {
    case findStore = 0
    case directions = 1
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .findStore:
            return "매장 찾기"
        case .directions:
            return "길찾기"
        }
    }
}

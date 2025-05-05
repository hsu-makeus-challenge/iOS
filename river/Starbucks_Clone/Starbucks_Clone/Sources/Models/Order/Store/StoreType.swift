//
//  StoreType.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/3/25.
//

import Foundation

enum StoreType: CaseIterable, Decodable {
    case reserve
    case driveThru
    
    var iconName: String {
        switch self {
        case .reserve: "Order/Sheet/reserve"
        case .driveThru: "Order/Sheet/driveThru"
        }
    }
}

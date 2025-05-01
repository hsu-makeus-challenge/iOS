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
}

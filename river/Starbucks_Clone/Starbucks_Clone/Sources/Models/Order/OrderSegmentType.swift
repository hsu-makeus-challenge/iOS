//
//  OrderSegmentType.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/1/25.
//

import Foundation

enum OrderSegmentType: String, CaseIterable, Identifiable {
    var id: Self { self } // Picker에서 사용하기 위한 Identifiable 채택
    
    case allMenu = "전체 메뉴"
    case myMenu = "나만의 메뉴"
}

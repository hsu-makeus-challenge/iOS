//
//  Coffee.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 4/3/25.
//

import Foundation

struct Coffee: Hashable {
    let id = UUID()
    let name: String
    let englishName: String
    let image: String
    let content: String
    let price: Int
    let tempType: CoffeeTempType
}

enum CoffeeTempType: String {
    case hot
    case iced
    case hotOnly
    case icedOnly
}

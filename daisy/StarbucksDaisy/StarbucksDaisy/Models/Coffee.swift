//
//  Coffee.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 4/3/25.
//

import Foundation

struct Coffee {
    let id = UUID()
    let name: String
    let englishName: String
    let image: String
    let content: String
    let price: Double
    let isTwoType: Bool
    let isIce: Bool
    let isHot: Bool
}

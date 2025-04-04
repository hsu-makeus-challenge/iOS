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
}

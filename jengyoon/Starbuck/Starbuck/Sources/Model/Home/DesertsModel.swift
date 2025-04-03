//
//  DesertsModel.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import Foundation

struct DesertsModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let imageName: String
}

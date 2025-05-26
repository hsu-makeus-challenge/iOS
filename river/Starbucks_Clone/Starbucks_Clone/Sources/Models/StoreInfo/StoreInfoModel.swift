//
//  StoreInfoModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/27/25.
//

import Foundation

struct StoreInfoModel: Identifiable {
    let id = UUID()
    let name: String
    let address: String
}

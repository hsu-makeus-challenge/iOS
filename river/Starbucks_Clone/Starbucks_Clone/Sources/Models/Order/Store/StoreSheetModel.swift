//
//  StoreSheetModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/2/25.
//

import Foundation

struct StoreSheetModel {
    let id = UUID()
    let storeList: [StoreList]
}

enum StoreType: CaseIterable {
    case reserve
    case driveThru
    
    var iconName: String {
        switch self {
        case .reserve: "Order/Sheet/reserve"
        case .driveThru: "Order/Sheet/driveThru"
        }
    }
}

struct StoreList: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let address: String
    /// Set 선언 이유
    /// 1. 중복 방지 2. .contains()로 빠른 탐색
    let storeType: Set<StoreType>?
    let distance: Int
}

extension StoreSheetModel {
    static let mockData: StoreSheetModel = .init(
        storeList: [
            .init(
                imageName: "Order/Sheet/image1",
                title: "서울역",
                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
                storeType: [.reserve, .driveThru],
                distance: 527
            ),
            .init(
                imageName: "Order/Sheet/image2",
                title: "한성대",
                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
                storeType: [.reserve],
                distance: 7
            ),
            .init(
                imageName: "Order/Sheet/image3",
                title: "서울여대",
                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
                storeType: nil,
                distance: 27
            ),
            .init(
                imageName: "Order/Sheet/image4",
                title: "중앙대",
                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
                storeType: nil,
                distance: 417
            ),
            .init(
                imageName: "Order/Sheet/image5",
                title: "서울역",
                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
                storeType: [.reserve, .driveThru],
                distance: 127
            ),
            .init(
                imageName: "Order/Sheet/image6",
                title: "서울역",
                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
                storeType: [.driveThru],
                distance: 307
            ),
            .init(
                imageName: "Order/Sheet/image7",
                title: "서울역",
                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
                storeType: [.reserve, .driveThru],
                distance: 227
            ),
            .init(
                imageName: "Order/Sheet/image7",
                title: "서울역",
                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
                storeType: [.reserve, .driveThru],
                distance: 127
            ),
        ]
    )
}

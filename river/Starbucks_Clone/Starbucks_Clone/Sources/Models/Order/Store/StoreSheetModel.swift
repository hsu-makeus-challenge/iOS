//
//  StoreSheetModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/2/25.
//

import Foundation
import CoreLocation

struct StoreSheetModel: Decodable {
    var id = UUID()
    var storeList: [StoreList]
}

struct Coordinator: Decodable {
    let latitude: Double
    let longitude: Double
}

struct StoreList: Identifiable, Decodable {
    var id = UUID()
    let imageName: String
    let title: String
    let address: String
    /// Set 선언 이유
    /// 1. 중복 방지 2. .contains()로 빠른 탐색
    let storeType: Set<StoreType>?
    let coordinate: Coordinator
    let distance: Double
}

extension StoreSheetModel {
    /// 매장 리스트를 정렬하는 도메인 로직
    ///
    /// ViewModel이 아닌 Model에 작성한 이유:
    /// - 이 정렬은 단순히 UI를 위한 포맷팅이 아니라, '가까운 매장' 또는 '자주 가는 매장'과 같이 비즈니스 규칙에 해당하는 로직이기 때문
    /// - 즉, 앱이 매장을 어떤 기준으로 정렬할지를 결정하는 핵심 로직이며, 이는 Model의 책임이다.
    /// - ViewModel에서는 이 메서드를 호출만 하여 상태를 조정하고, View는 정렬된 리스트만 받아 UI에 반영하면 됨
    func sorted(by type: StoreSortType) -> [StoreList] {
        switch type {
        case .distance:
            return storeList.sorted { $0.distance < $1.distance }
        case .frequently:
            // TODO: 추후 자주 방문한 기준으로 정렬 필요
            return storeList.sorted { $0.title < $1.title }
        }
    }
}

//extension StoreSheetModel {
//    static let mockData: StoreSheetModel = .init(
//        storeList: [
//            .init(
//                imageName: "Order/Sheet/image1",
//                title: "서울역",
//                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
//                storeType: [.reserve, .driveThru],
//                distance: 527
//            ),
//            .init(
//                imageName: "Order/Sheet/image2",
//                title: "한성대",
//                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
//                storeType: [.reserve],
//                distance: 7
//            ),
//            .init(
//                imageName: "Order/Sheet/image3",
//                title: "서울여대",
//                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
//                storeType: nil,
//                distance: 27
//            ),
//            .init(
//                imageName: "Order/Sheet/image4",
//                title: "중앙대",
//                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
//                storeType: nil,
//                distance: 417
//            ),
//            .init(
//                imageName: "Order/Sheet/image5",
//                title: "서울역",
//                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
//                storeType: [.reserve, .driveThru],
//                distance: 127
//            ),
//            .init(
//                imageName: "Order/Sheet/image6",
//                title: "서울역",
//                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
//                storeType: [.driveThru],
//                distance: 307
//            ),
//            .init(
//                imageName: "Order/Sheet/image7",
//                title: "서울역",
//                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
//                storeType: [.reserve, .driveThru],
//                distance: 227
//            ),
//            .init(
//                imageName: "Order/Sheet/image7",
//                title: "서울역",
//                address: "서울 용산구 한강대로 405 (동자동) 신-101호",
//                storeType: [.reserve, .driveThru],
//                distance: 127
//            ),
//        ]
//    )
//}

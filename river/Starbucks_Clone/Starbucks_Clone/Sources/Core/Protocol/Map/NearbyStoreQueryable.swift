//
//  NearbyStoreQueryable.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/27/25.
//

import Foundation

protocol NearbyStoreQueryable: AnyObject {
    /// 지도에서 현재 위치 기준으로 주변의 매장을 몇 Km까지 보여줄지 결정하는 함수
    func getNearbyStores(within range: Double) -> [StoreList]
}

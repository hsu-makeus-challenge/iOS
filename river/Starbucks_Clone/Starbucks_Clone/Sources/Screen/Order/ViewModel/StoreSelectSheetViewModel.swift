//
//  StoreSelectSheetViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/2/25.
//

import Foundation

@Observable
class StoreSelectSheetViewModel: DefaultMapStoreProvider, NearbyStoreQueryable {
    private let router: NavigationRouter
    
    init(
        router: NavigationRouter
    ) {
        self.router = router
    }
    
    var sortedStoreListWithDistance: [StoreList] {
        storeList.sorted { $0.distance < $1.distance }
    }
    
    func getNearbyStores(within range: Double) -> [StoreList] {
        return storeList.filter { $0.distance < range }
    }
    
    func loadStores() {
        loadStarbucksStores { [weak self] stores in
            guard let self = self else { return }
            self.storeSheetModel.storeList = self.makeStoreList(from: stores)
        }
    }
    
}

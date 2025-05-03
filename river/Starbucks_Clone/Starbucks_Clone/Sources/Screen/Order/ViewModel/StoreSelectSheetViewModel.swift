//
//  StoreSelectSheetViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/2/25.
//

import Foundation

@Observable
class StoreSelectSheetViewModel {
    private var router: NavigationRouter
    
    init(router: NavigationRouter) {
        self.router = router
    }
    
    var storeSheetModel: StoreSheetModel = .mockData
    var storeSortType: StoreSortType = .distance
    
    var storeList: [StoreList] {
        storeSheetModel.storeList
    }
    
    var sortedStoreList: [StoreList] {
        storeSheetModel.sorted(by: storeSortType)
    }
}

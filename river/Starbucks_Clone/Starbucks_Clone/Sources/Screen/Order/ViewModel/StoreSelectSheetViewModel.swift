//
//  StoreSelectSheetViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/2/25.
//

import Foundation

@Observable
class StoreSelectSheetViewModel {
    private let router: NavigationRouter
    let mapViewModel: MapViewModel
    
    init(
        router: NavigationRouter,
        mapViewModel: MapViewModel
    ) {
        self.router = router
        self.mapViewModel = mapViewModel
    }
    
    var sortedStoreListWithDistance: [StoreList] {
        mapViewModel.storeList.sorted { $0.distance < $1.distance }
    }
    
    func loadStores() {
        mapViewModel.loadStarbucksStores { [weak self] stores in
            guard let self = self else { return }
            self.mapViewModel.storeSheetModel.storeList = self.mapViewModel.makeStoreList(from: stores)
        }
    }
    
}

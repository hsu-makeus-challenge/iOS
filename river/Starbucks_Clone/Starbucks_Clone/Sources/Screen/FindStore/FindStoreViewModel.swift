//
//  FindStoreViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/22/25.
//

import Foundation

@Observable
class FindStoreViewModel: MapControllable {
    
    var storeSheetModel: StoreSheetModel = .init(storeList: [])
    
    var storeList: [StoreList] {
        storeSheetModel.storeList
    }
    
    var nearbyStores: [StoreList] {
        storeList.filter { $0.distance < 10 }
    }
}

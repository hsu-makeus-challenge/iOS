//
//  StoreSelectSheetViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/2/25.
//

import Foundation
import CoreLocation

@Observable
class StoreSelectSheetViewModel {
    private var router: NavigationRouter
    
    init(router: NavigationRouter) {
        self.router = router
    }
    
    var storeSheetModel: StoreSheetModel = .init(storeList: [])
    var storeSortType: StoreSortType = .distance
    
    var storeList: [StoreList] {
        storeSheetModel.storeList
    }
    
    var sortedStoreList: [StoreList] {
        storeSheetModel.sorted(by: storeSortType)
    }
    
    func starBucksStoreList() {
        JSONFileLoader.shared.load(
            named: "스타벅스_2025 데이터",
            fileExtension: "geojson"
        ) { [weak self] (result: Result<StarbucksGeoJSON, Error>) in
            switch result {
            case .success(let model):
                let storeImage: [String] = [
                    "Order/Sheet/image1",
                    "Order/Sheet/image2",
                    "Order/Sheet/image3",
                    "Order/Sheet/image4",
                    "Order/Sheet/image5",
                    "Order/Sheet/image6",
                    "Order/Sheet/image7",
                ]
                self?.storeSheetModel.storeList = model.features.enumerated().compactMap { idx, storeFeature in
                    let properties = storeFeature.properties
                    let imageName = storeImage[idx % storeImage.count]
                    var storeType: Set<StoreType>? {
                        var type = Set<StoreType>()
                        
                        if properties.category.contains("리저브 매장") {
                            type.insert(.reserve)
                        }
                        
                        if properties.category.contains("DT 매장") {
                            type.insert(.driveThru)
                        }
                        
                        return type.isEmpty ? nil : type
                    }
                    
                    var distance: Double {
                        let coordinates = storeFeature.geometry.coordinates
                        let storeLocation: CLLocation = .init(latitude: coordinates[1], longitude: coordinates[0])
                        let currentLocation: CLLocation = .init(latitude: 37.498908, longitude: 126.867345)
                        
                        let distanceFromStore = currentLocation.distance(from: storeLocation) / 1000
                        
                        return Double(distanceFromStore)
                    }
                    
                    return StoreList(
                        imageName: imageName,
                        title: storeFeature.properties.storeName,
                        address: storeFeature.properties.address,
                        storeType: storeType,
                        coordinate: Coordinator(
                            latitude: storeFeature.geometry.coordinates[0],
                            longitude: storeFeature.geometry.coordinates[1]
                        ),
                        distance: distance
                    )
                }
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
}

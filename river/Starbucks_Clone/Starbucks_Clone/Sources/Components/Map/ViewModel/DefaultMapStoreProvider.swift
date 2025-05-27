//
//  BaseMapViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/22/25.
//

import Foundation
import CoreLocation

// FIXME: 시간될때 상속받아 StoreDataProvidable를 채택하는 구조에서 DI를 통해 함수와 프로퍼티 사용할 수 있도록 리팩토링 필요
class DefaultMapStoreProvider: StoreDataProvidable {
    var storeSheetModel: StoreSheetModel = .init(storeList: [])
    var storeSortType: StoreSortType = .distance
    
    var storeList: [StoreList] {
        storeSheetModel.storeList
    }
    
    func loadStarbucksStores(completion: @escaping ([StoreFeature]) -> Void) {
        JSONFileLoader.shared.load(
            named: "스타벅스_2025 데이터",
            fileExtension: "geojson"
        ) { (result: Result<StarbucksGeoJSON, Error>) in
            switch result {
            case .success(let model):
                completion(model.features)
            case .failure(let error):
                print("error: \(error.localizedDescription)")
                completion([])
            }
        }
    }
    
    func makeStoreList(from features: [StoreFeature]) -> [StoreList] {
        let storeImage: [String] = [
            "Order/Sheet/image1",
            "Order/Sheet/image2",
            "Order/Sheet/image3",
            "Order/Sheet/image4",
            "Order/Sheet/image5",
            "Order/Sheet/image6",
            "Order/Sheet/image7",
        ]
        
        return features.enumerated().compactMap { idx, feature in
            let props = feature.properties
            return StoreList(
                imageName: storeImage[idx % storeImage.count],
                title: props.storeName,
                address: props.address,
                storeType: parseStoreType(from: feature.properties.category),
                coordinate: Coordinator(
                    latitude: feature.geometry.coordinates[1],
                    longitude: feature.geometry.coordinates[0]
                ),
                distance: calculateDistance(from: feature.geometry.coordinates)
            )
        }
    }
    
    private func parseStoreType(from category: String) -> Set<StoreType>? {
        var type = Set<StoreType>()
        if category.contains("리저브 매장") {
            type.insert(.reserve)
        }
        if category.contains("DT 매장") {
            type.insert(.driveThru)
        }
        return type.isEmpty ? nil : type
    }
    
    private func calculateDistance(from coordinates: [Double]) -> Double {
        let currentCoordinates = LocationManager.shared.currentLocation?.coordinate
        guard let currentCoordinates else { return 0 }
        let storeLocation: CLLocation = .init(
            latitude: coordinates[1],
            longitude: coordinates[0]
        )
        let currentLocation: CLLocation = .init(
            latitude: currentCoordinates.latitude,
            longitude: currentCoordinates.longitude
        )
        let distanceFromStore = currentLocation.distance(from: storeLocation) / 1000
        
        return Double(distanceFromStore)
    }
}

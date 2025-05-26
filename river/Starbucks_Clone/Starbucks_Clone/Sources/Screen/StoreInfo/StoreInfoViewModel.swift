//
//  StoreInfoViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/22/25.
//

import Foundation
import CoreLocation

@Observable
class StoreInfoViewModel: BaseMapViewModel {
    private let locationManager: LocationManager
    
    var currentAddress: String?
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
    
    override func loadStarbucksStores() {
        JSONFileLoader.shared.load(
            named: "스타벅스_2025 데이터",
            fileExtension: "geojson"
        ) { [weak self] (result: Result<StarbucksGeoJSON, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.storeSheetModel.storeList = self.makeStoreList(from: model.features)
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
    func getCurrentLocationAddress() {
        guard let currentLocation = locationManager.currentLocation else { return }
        Task {
            currentAddress = try await GeocodingManager.shared.reverseGeoCode(with: currentLocation)
        }
    }
}

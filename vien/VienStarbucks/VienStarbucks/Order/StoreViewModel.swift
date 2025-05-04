
import Foundation
import CoreLocation
import SwiftUI

class StoreViewModel: ObservableObject {
    @Published var stores: [Store] = []

    private let userLocation = CLLocation(latitude: 37.48118, longitude: 126.951324)

    init() {
        loadStoresFromGeoJSON()
    }

    func loadStoresFromGeoJSON() {
        guard let url = Bundle.main.url(forResource: "Starbucks2025Data", withExtension: "geojson") else {
            print("❌ geojson 파일 없음")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(GeoJSONRoot.self, from: data)

            let parsedStores = decoded.features.compactMap { feature -> Store? in
                let props = feature.properties
                let coord = CLLocationCoordinate2D(latitude: props.Ycoordinate, longitude: props.Xcoordinate)
                let location = CLLocation(latitude: props.Ycoordinate, longitude: props.Xcoordinate)
                let distance = userLocation.distance(from: location) / 1000

                guard distance <= 10 else { return nil } // 10km 필터링

                let category = StoreCategory(from: props.Category)

                return Store(
                    name: props.Sotre_nm,
                    address: props.Address,
                    phone: props.Telephone,
                    category: category,
                    coordinate: coord,
                    distanceInKm: distance,
                    imageName: "defaultStoreImage"
                )
            }

            DispatchQueue.main.async {
                self.stores = parsedStores.sorted { $0.distanceInKm < $1.distanceInKm }
            }
        } catch {
            print("❌ 디코딩 실패: \(error)")
        }
    }
}

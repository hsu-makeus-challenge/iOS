
// 2. StoreModel.swift

import Foundation
import CoreLocation

struct Store: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let phone: String
    let category: StoreCategory
    let coordinate: CLLocationCoordinate2D
    let distanceInKm: Double
    let imageName: String

    var distanceText: String {
        String(format: "%.1fkm", distanceInKm)
    }
}

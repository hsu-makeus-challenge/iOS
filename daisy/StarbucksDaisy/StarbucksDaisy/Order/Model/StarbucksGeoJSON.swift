//
//  Store.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 5/4/25.
//

import Foundation
import CoreLocation

// 최상위 FeatureCollection
struct StarbucksGeoJSON: Codable {
    let type: String
    let name: String
    let features: [StarbucksFeature]
}

// 각 Feature (매장 하나)
struct StarbucksFeature: Codable, Identifiable {
    var id: String { properties.seq } // Identifiable 채택
    let type: String
    let properties: StarbucksProperties
    let geometry: StarbucksGeometry
}

// 매장 정보
struct StarbucksProperties: Codable {
    let seq: String
    let storeName: String
    let address: String
    let telephone: String
    let category: String?
    let yCoordinate: Double
    let xCoordinate: Double

    enum CodingKeys: String, CodingKey {
        case seq = "Seq"
        case storeName = "Sotre_nm"
        case address = "Address"
        case telephone = "Telephone"
        case category = "Category"
        case yCoordinate = "Ycoordinate"
        case xCoordinate = "Xcoordinate"
    }
}

// 좌표 정보
struct StarbucksGeometry: Codable {
    let type: String
    let coordinates: [Double] // [longitude, latitude]
    
    var locationCoordinate: CLLocationCoordinate2D {
        guard coordinates.count == 2 else { return .init() }
        return CLLocationCoordinate2D(latitude: coordinates[1], longitude: coordinates[0])
    }
}

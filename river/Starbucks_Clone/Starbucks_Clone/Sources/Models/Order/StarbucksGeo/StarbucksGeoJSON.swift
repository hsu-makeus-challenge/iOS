//
//  StarbucksGeoJSON.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/3/25.
//

import Foundation

/// 전체 GeoJSON 파일을 나타내는 최상위 모델
struct StarbucksGeoJSON: Decodable {
    let type: String
    let name: String
    let features: [StoreFeature]
}

/// 각 매장을 나타내는 Feature
struct StoreFeature: Decodable {
    let type: String
    let properties: StoreProperties
    let geometry: StoreGeometry
}

/// 매장의 속성 정보
struct StoreProperties: Decodable {
    let seq: String
    let storeName: String
    let address: String
    let telephone: String
    let category: String
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

/// 좌표 정보를 담는 Geometry
struct StoreGeometry: Decodable {
    let type: String
    let coordinates: [Double]  // [경도, 위도]
}

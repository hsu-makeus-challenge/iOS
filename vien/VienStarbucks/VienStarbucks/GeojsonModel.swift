//
//  GeojsonModel.swift
//  VienStarbucks
//
//  Created by 이은정 on 5/1/25.
//

import Foundation
import CoreLocation

struct GeoJSONRoot: Decodable {
    let features: [StoreFeature]
}

struct StoreFeature: Decodable {
    let properties: StoreProperties
    let geometry: Geometry
}

struct StoreProperties: Decodable {
    let Sotre_nm: String
    let Address: String
    let Telephone: String
    let Category: String?
    let Ycoordinate: Double
    let Xcoordinate: Double
}

struct Geometry: Decodable {
    let coordinates: [Double]
}

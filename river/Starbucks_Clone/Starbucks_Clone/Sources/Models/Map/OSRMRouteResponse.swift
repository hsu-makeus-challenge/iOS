//
//  OSRMRouteResponse.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/27/25.
//

import Foundation

struct OSRMRouteResponse: Decodable {
    let routes: [OSRMRoute]
}

struct OSRMRoute: Decodable {
    let geometry: OSRMGeometry
}

struct OSRMGeometry: Decodable {
    let coordinates: [[Double]]  // [longitude, latitude]
}

//
//  Marker.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/4/25.
//

import Foundation
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}

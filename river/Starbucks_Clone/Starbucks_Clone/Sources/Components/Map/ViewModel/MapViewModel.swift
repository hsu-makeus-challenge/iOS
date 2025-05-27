//
//  MapViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/21/25.
//

import Foundation
import Moya
import MapKit

@Observable
final class MapViewModel {
    private let provider: MoyaProvider<OsrmAPI>
    private let locationManager: LocationManager
    private let mapInteractable: MapInteractable
    var region: MKCoordinateRegion? = nil
    
    private let coordinates = [
        Coordinator(latitude: 37.499588, longitude: 126.867394),
        Coordinator(latitude: 37.501546, longitude: 126.882223)
    ]
    
    init(
        provider: MoyaProvider<OsrmAPI> = APIManager.shared.testProvider(for: OsrmAPI.self),
        locationManager: LocationManager,
        mapInteractable: MapInteractable
    ) {
        self.mapInteractable = mapInteractable
        self.provider = provider
        self.locationManager = locationManager
    }
    
    func getMapInteractable() -> MapInteractable {
        return mapInteractable
    }
    
    /// 현재 위치 받아온 후 region 생성하는 함수
    func updateRegionFromCurrentLocation() {
        if let current = locationManager.currentLocation {
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: current.coordinate.latitude,
                    longitude: current.coordinate.longitude
                ),
                span: MKCoordinateSpan(latitudeDelta: 0.18, longitudeDelta: 0.18)
            )
        }
    }
    
    func testRequest() {
        provider.request(.requestRoute(route: .route, profile: .foot, coordinates: coordinates)) { result in
            switch result {
            case .success(let response):
                print("경로 응답: \(response)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

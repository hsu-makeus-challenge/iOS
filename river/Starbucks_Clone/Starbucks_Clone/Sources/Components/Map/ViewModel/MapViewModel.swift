//
//  MapViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/21/25.
//

import Foundation
import Moya
import MapKit

/// MapViewModel을 주입받아야 지도 기능 사용 가능
@Observable
final class MapViewModel: DefaultMapStoreProvider {
    private let provider: MoyaProvider<OsrmAPI>
    private let locationManager: LocationManager
    var region: MKCoordinateRegion? = nil
    
    var polylineCoordinates: [CLLocationCoordinate2D] = []
    
    private let coordinates = [
        Coordinator(latitude: 37.499588, longitude: 126.867394),
        Coordinator(latitude: 37.501546, longitude: 126.882223)
    ]
    
    init(
        provider: MoyaProvider<OsrmAPI> = APIManager.shared.createProvider(for: OsrmAPI.self),
        locationManager: LocationManager
    ) {
        self.provider = provider
        self.locationManager = locationManager
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
    
    func fetchRouteWithOSRM(_ route: RouteCoordinate) async {
        do {
            let response = try await provider.requestAsync(.requestRoute(
                route: .route, profile: .foot, coordinates: coordinates
            ))
            let result = try JSONDecoder().decode(OSRMRouteResponse.self, from: response.data)
            if let firstRoute = result.routes.first {
                polylineCoordinates = firstRoute.geometry.coordinates.map {
                    CLLocationCoordinate2D(latitude: $0[1], longitude: $0[0])
                }
            }
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
}

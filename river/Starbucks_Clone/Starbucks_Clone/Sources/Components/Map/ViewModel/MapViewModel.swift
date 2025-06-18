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
    
    /// 찾은 경로들의 모든 위도와 경도를 저장해두는 프로퍼티
    var polylineCoordinates: [CLLocationCoordinate2D] = []
    
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
    
    func fetchRouteWithOSRM(
        _ coordinates: RouteCoordinate,
        route: RouteType = .route,
        profile: ProfileType = .foot
    ) async {
        do {
            let response = try await provider.requestAsync(.requestRoute(
                route: route, profile: profile, coordinates: coordinates
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

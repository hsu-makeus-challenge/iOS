//
//  StoreInfoViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/22/25.
//

import Foundation
import CoreLocation
import Moya

@Observable
class StoreInfoViewModel {
    private let locationManager: LocationManager
    private let provider: MoyaProvider<KakaoAPI>
    let mapViewModel: MapViewModel
    
    var searchPlaceList: [StoreInfoModel] = [] // 카카오 API로 검색한 장소를 저장하는 프로퍼티
    var starbucksStores: [StoreFeature] = [] // 로컬에 있는 스타벅스 geojson을 저장해두는 프로퍼티
    
    init(
        provider: MoyaProvider<KakaoAPI> = APIManager.shared.createProvider(for: KakaoAPI.self),
        locationManager: LocationManager,
        mapViewModel: MapViewModel
    ) {
        self.locationManager = locationManager
        self.provider = provider
        self.mapViewModel = mapViewModel
    }
    
    func loadStores() {
        mapViewModel.loadStarbucksStores { [weak self] stores in
            self?.starbucksStores = stores
        }
    }
    
    @MainActor
    func getCurrentLocationAddress() async -> String? {
        guard let currentLocation = locationManager.currentLocation else { return nil }
        do {
            let currentAddress = try await GeocodingManager.shared.reverseGeoCode(with: currentLocation)
            return currentAddress
        } catch {
            print("지오코딩 실패: \(error.localizedDescription)")
            return nil
        }
    }
    
    /// 출발지와 도착지 주소를 받아 경로를 탐색하고, 해당 경로에 대한 데이터를 MapViewModel에 전달하여 지도에 경로를 표시하는 함수
    ///
    /// - Parameters:
    ///   - startAddress: 경로 탐색의 출발지 주소 문자열입니다.
    ///   - finishAddress: 경로 탐색의 도착지 주소 문자열입니다.
    ///
    /// 이 함수는 주소를 좌표로 변환한 뒤, 두 지점 간의 경로를 OSRM API를 통해 비동기로 요청.
    /// 요청 결과로 받은 좌표 배열을 이용해 지도에 경로(Polyline)를 그리는 로직은 `MapViewModel`의 `fetchRouteWithOSRM(_:)`에서 처리
    @MainActor
    func findRouteBtnTapped(
        from startAddress: String,
        to finishAddress: String
    ) async {
        do {
            if let startLocation = try await GeocodingManager.shared.geoCode(with: startAddress),
               let finishLocation = try await GeocodingManager.shared.geoCode(with: finishAddress) {
                let route: RouteCoordinate = .init(
                    from: startLocation.coordinate,
                    to: finishLocation.coordinate
                )
                print("route:\(route)")
                await mapViewModel.fetchRouteWithOSRM(route)
            }
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
    
    func addressSearchWithKakao(_ keyword: String) async {
        do {
            let response = try await provider.requestAsync(.addressSearch(query: keyword))
            guard (200..<300).contains(response.statusCode) else {
                print("API 실패 상태 코드: \(response.statusCode)")
                return
            }
            let result = try JSONDecoder().decode(KakaoPlaceSearchResponse.self, from: response.data)
            searchPlaceList = result.documents.map {
                return StoreInfoModel(
                    name: $0.placeName,
                    address: $0.roadAddressName
                )
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func searchStarbucksStore(_ keyword: String) {
        if !keyword.isEmpty {
            searchPlaceList = starbucksStores.filter { store in
                // 매장명과 주소에서 키워드가 포함된 내용 필터링
                let storeName = store.properties.storeName
                let address = store.properties.address
                return storeName.contains(keyword) || address.contains(keyword)
            }.map {
                return StoreInfoModel(
                    name: $0.properties.storeName,
                    address: $0.properties.address
                )
            }.sorted { $0.name > $1.name }
        } else {
            print("검색어가 없습니다.")
        }
    }
}

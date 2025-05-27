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
class StoreInfoViewModel: DefaultMapStoreProvider {
    private let locationManager: LocationManager
    private let provider: MoyaProvider<KakaoAPI>
    
    var searchPlaceList: [StoreInfoModel] = [] // 카카오 API로 검색한 장소를 저장하는 프로퍼티
    var starbucksStores: [StoreFeature] = [] // 로컬에 있는 스타벅스 geojson을 저장해두는 프로퍼티
    
    init(
        provider: MoyaProvider<KakaoAPI> = APIManager.shared.createProvider(for: KakaoAPI.self),
        locationManager: LocationManager
    ) {
        self.locationManager = locationManager
        self.provider = provider
    }
    
    func loadStores() {
        loadStarbucksStores { [weak self] stores in
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
                    address: $0.addressName
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

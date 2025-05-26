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
class StoreInfoViewModel: BaseMapViewModel {
    private let locationManager: LocationManager
    private let provider: MoyaProvider<KakaoAPI>
    
    var currentAddress: String?
    
    init(
        provider: MoyaProvider<KakaoAPI> = APIManager.shared.createProvider(for: KakaoAPI.self),
        locationManager: LocationManager
    ) {
        self.locationManager = locationManager
        self.provider = provider
    }
    
    override func loadStarbucksStores() {
        JSONFileLoader.shared.load(
            named: "스타벅스_2025 데이터",
            fileExtension: "geojson"
        ) { [weak self] (result: Result<StarbucksGeoJSON, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.storeSheetModel.storeList = self.makeStoreList(from: model.features)
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
    func getCurrentLocationAddress() async {
        guard let currentLocation = locationManager.currentLocation else { return }
        do {
            currentAddress = try await GeocodingManager.shared.reverseGeoCode(with: currentLocation)
        } catch {
            print("지오코딩 실패: \(error.localizedDescription)")
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
            print(result.documents)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

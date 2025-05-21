//
//  MapViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/21/25.
//

import Foundation
import Moya

@Observable
class MapViewModel {
    private let provider: MoyaProvider<OsrmAPI>
    
    private let coordinates = [
        Coordinator(latitude: 37.499588, longitude: 126.867394),
        Coordinator(latitude: 37.501546, longitude: 126.882223)
    ]
    
    init(provider: MoyaProvider<OsrmAPI> = APIManager.shared.createProvider(for: OsrmAPI.self)) {
        self.provider = provider
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

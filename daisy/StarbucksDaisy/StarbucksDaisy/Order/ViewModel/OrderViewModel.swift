//
//  OrderViewModel.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 5/1/25.
//

import Foundation
import CoreLocation

@Observable
class OrderViewModel: NSObject, CLLocationManagerDelegate {
    var selectedSegment: OrderSegment = .first
    var selectedMenuSegment: MenuSegment = .first
    var selectedPlaceSegment: PlaceSegment = .first

    var stores: [StarbucksFeature] = []
    var userLocation: CLLocation?
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        loadStores()
    }
    
    func loadStores() {
        guard let url = Bundle.main.url(forResource: "스타벅스_2025 데이터", withExtension: "geojson") else {
            print("json 파일 없음")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(StarbucksGeoJSON.self, from: data)
            self.stores = decoded.features
        } catch {
            print("디코딩 실패: \(error)")
        }
    }
    
    func distanceFromUser(to store: StarbucksFeature) -> String {
        guard let userLoc = userLocation else { return "거리 계산 중..." }
        let storeLoc = CLLocation(latitude: store.geometry.locationCoordinate.latitude,
                                  longitude: store.geometry.locationCoordinate.longitude)
        let distance = userLoc.distance(from: storeLoc) / 1000.0 // km
        return String(format: "%.2f km", distance)
    }
    
    // CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations.first
    }
    
    var OrderBeverageMenus = [
        BeverageMenu(title: "추천", englishTitle: "Recommend", imageName: "BeverageMenu/img-0", showDot: true),
        BeverageMenu(title: "아이스 카페 아메리카노", englishTitle: "Iced Caffe Americano", imageName: "BeverageMenu/img-1", showDot: true),
        BeverageMenu(title: "카페 아메리카노", englishTitle: "Caffe Americano", imageName: "BeverageMenu/img-2", showDot: true),
        BeverageMenu(title: "카푸치노", englishTitle: "Cappuccino", imageName: "BeverageMenu/img-3", showDot: false),
        BeverageMenu(title: "아이스 카푸치노", englishTitle: "Iced Cappuccio", imageName: "BeverageMenu/img-4", showDot: true),
        BeverageMenu(title: "카라멜 마키아또", englishTitle: "Caramel Macchiato", imageName: "BeverageMenu/img-5", showDot: true),
        BeverageMenu(title: "아이스 카라멜 마키아또", englishTitle: "Iced Caramel Macchiato", imageName: "BeverageMenu/img-6", showDot: true),
        BeverageMenu(title: "아포가토/기타", englishTitle: "Others", imageName: "BeverageMenu/img-7", showDot: false),
        BeverageMenu(title: "럼 샷 코르타도", englishTitle: "Rum Shot Cortado", imageName: "BeverageMenu/img-8", showDot: true),
        BeverageMenu(title: "라벤터 카페 브레베", englishTitle: "Lavender Cafe Breve", imageName: "BeverageMenu/img-9", showDot: true),
        BeverageMenu(title: "병음료", englishTitle: "RTD", imageName: "BeverageMenu/img-10", showDot: false)
    ]
}

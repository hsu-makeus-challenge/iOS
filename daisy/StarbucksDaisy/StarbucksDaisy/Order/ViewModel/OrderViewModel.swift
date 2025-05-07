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
    var storeAddresses: [String: String] = [:] // storeID: 주소
    var userLocation: CLLocation?
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
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
            sortStoresByDistance()
        } catch {
            print("디코딩 실패: \(error)")
        }
    }
    
    func requestUserLocationOnce() {
        locationManager.startUpdatingLocation()
    }
    
    func distanceFromUser(to store: StarbucksFeature) -> String {
        guard let userLoc = userLocation else { return "거리 계산 중..." }
        let storeLoc = CLLocation(latitude: store.geometry.locationCoordinate.latitude,
                                  longitude: store.geometry.locationCoordinate.longitude)
        let distance = userLoc.distance(from: storeLoc) / 1000.0 // km
        return String(format: "%.1f km", distance)
    }
    
    func sortStoresByDistance() {
        guard let userLoc = userLocation else { return }
        
        self.stores.sort {
            let loc1 = CLLocation(latitude: $0.geometry.locationCoordinate.latitude,
                                  longitude: $0.geometry.locationCoordinate.longitude)
            let loc2 = CLLocation(latitude: $1.geometry.locationCoordinate.latitude,
                                  longitude: $1.geometry.locationCoordinate.longitude)
            return userLoc.distance(from: loc1) < userLoc.distance(from: loc2)
        }
    }
    
    func reverseGeocode(latitude: Double, longitude: Double) async -> String {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        do {
            let placemarks = try await geocoder.reverseGeocodeLocation(location)
            if let placemark = placemarks.first {
                let addressParts = [
                    placemark.administrativeArea,
                    placemark.locality,
                    placemark.subLocality,
                    placemark.thoroughfare
                ].compactMap { $0 }
                
                if addressParts.isEmpty {
                    print("📭 주소 구성 요소 없음 for \(latitude), \(longitude)")
                    return "주소 정보 없음"
                }
                
                let address = addressParts.joined(separator: " ")
                print("📍 역지오코딩 주소: \(address)")
                return address
            } else {
                print("⚠️ placemarks.first is nil for \(latitude), \(longitude)")
            }
        } catch {
            print("❌ 역지오코딩 에러: \(error.localizedDescription)")
        }
        
        return "주소 정보 없음"
    }
    
    // CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
                userLocation = location
                locationManager.stopUpdatingLocation() // 위치 한 번만 받도록 정지
            }
        sortStoresByDistance()
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

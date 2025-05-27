//
//  GeocodingManager.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/22/25.
//

import Foundation
import CoreLocation

@Observable
class GeocodingManager {
    static let shared = GeocodingManager()
    
    private let geocoder = CLGeocoder()
    
    /// 주소를 지오코딩하여 위도,경도를 알아내는 함수
    /// - Parameters:
    ///     - with address: 변환할 주소
    /// - Returns: - CLLocation 타입으로 변환한 위,경도 반환
    func geoCode(
        with address: String
    ) async throws -> CLLocation? {
        var result: CLLocation? = nil
        do {
            let placemarks = try await geocoder.geocodeAddressString(address)
            if let location = placemarks.first?.location {
                print("위도: \(location.coordinate.latitude), 경도: \(location.coordinate.longitude)")
                result = location
            }
        } catch {
            print("지오코딩 에러: \(error.localizedDescription)")
        }
        return result
    }
    
    /// 위도, 경도를 역지오코딩하여 주소를 알아내는 함수
    /// - Parameters:
    ///     - with location: 변환할 위,경도
    /// - Returns: - String: 변환한 주소 반환
    func reverseGeoCode(
        with location: CLLocation
    ) async throws -> String? {
        var result: String? = nil
        do {
            let placemarks = try await geocoder.reverseGeocodeLocation(location)
            if let placemark = placemarks.first {
                let address = [
                    placemark.administrativeArea,
                    placemark.locality,
                    placemark.subLocality,
                    placemark.thoroughfare
                ].compactMap { $0 }.joined(separator: " ")
                
                print("주소: \(address)")
                result = address
            }
        } catch {
            print("역지오코딩 에러: \(error.localizedDescription)")
        }
        return result
    }
}

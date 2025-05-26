//
//  KakaoPlaceSearchResponse.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/26/25.
//

import Foundation

struct KakaoPlaceSearchResponse: Decodable {
    let documents: [KakaoSearchPlaceDocument]
    let meta: KakaoMeta?
}

struct KakaoSearchPlaceDocument: Decodable {
    let id: String
    let placeName: String
    let categoryName: String
    let categoryGroupCode: String
    let categoryGroupName: String
    let phone: String
    let addressName: String
    let roadAddressName: String
    let x: String  // 경도 (longitude)
    let y: String  // 위도 (latitude)
    let placeURL: String
    let distance: String?

    enum CodingKeys: String, CodingKey {
        case id
        case placeName = "place_name"
        case categoryName = "category_name"
        case categoryGroupCode = "category_group_code"
        case categoryGroupName = "category_group_name"
        case phone
        case addressName = "address_name"
        case roadAddressName = "road_address_name"
        case x
        case y
        case placeURL = "place_url"
        case distance
    }
}

// 메타 정보
struct KakaoMeta: Decodable {
    let isEnd: Bool
    let pageableCount: Int
    let sameName: KakaoSameName?
    let totalCount: Int

    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case sameName = "same_name"
        case totalCount = "total_count"
    }
}

// same_name 필드
struct KakaoSameName: Decodable {
    let keyword: String
    let region: [String]
    let selectedRegion: String

    enum CodingKeys: String, CodingKey {
        case keyword
        case region
        case selectedRegion = "selected_region"
    }
}

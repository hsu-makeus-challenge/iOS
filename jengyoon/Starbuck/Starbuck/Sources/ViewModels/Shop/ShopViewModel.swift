//
//  ShopViewModel.swift
//  Starbuck
//
//  Created by 송승윤 on 4/10/25.
//
import SwiftUI
import Foundation

// MARK: - ViewModel
class ShopViewModel: ObservableObject {
    // MARK: - Published Properties
    
    /// 상단 배너 이미지 이름 배열
    @Published var bannerImages: [String]
    
    /// 전체 상품 카테고리
    @Published var allProducts: [ShopItem]
    
    /// 베스트 상품 목록
    @Published var bestItems: [ShopItem]
    
    /// 신규 상품 목록
    @Published var newProducts: [ShopItem]
    
    // MARK: - Initialization
    
    init() {
        // Banner Images 초기화
        self.bannerImages = (1...3).map { "shopTopBanner\($0)" }
        
        // All Products 초기화
        self.allProducts = [
            ShopItem(imageName: "shopProduct1", name: "텀블러"),
            ShopItem(imageName: "shopProduct2", name: "커피 용품"),
            ShopItem(imageName: "shopProduct3", name: "선물 세트"),
            ShopItem(imageName: "shopProduct4", name: "보온병"),
            ShopItem(imageName: "shopProduct5", name: "머그"),
            ShopItem(imageName: "shopProduct6", name: "액세서리")
        ]
        
        // Best Items 초기화
        self.bestItems = [
            ShopItem(imageName: "shopBest1", name: "그린 사이렌 슬리브 머그", volume: "355ml"),
            ShopItem(imageName: "shopBest2", name: "그린 사이렌 클래식 머그", volume: "355ml"),
            ShopItem(imageName: "shopBest3", name: "사이렌 머그 앤 우드 소서", volume: "355ml"),
            ShopItem(imageName: "shopBest4", name: "리저브 골드 테일 머그"),
            ShopItem(imageName: "shopBest5", name: "블랙 링 머그 473ml"),
            ShopItem(imageName: "shopBest6", name: "블랙 링 머그 355ml"),
            ShopItem(imageName: "shopBest7", name: "북청사자놀음 데이머그", volume: "89ml"),
            ShopItem(imageName: "shopBest8", name: "서울 제주 데이머그 세트")
        ]
        
        // New Products 초기화
        self.newProducts = [
            ShopItem(imageName: "shop41", name: "그린 사이렌 도트 머그", volume: "237ml"),
            ShopItem(imageName: "shop42", name: "그린 사이렌 도트 머그", volume: "355ml"),
            ShopItem(imageName: "shop43", name: "홈 카페 미니 머그 세트"),
            ShopItem(imageName: "shop44", name: "홈 카페 글라스 세트")
        ]
    }
}


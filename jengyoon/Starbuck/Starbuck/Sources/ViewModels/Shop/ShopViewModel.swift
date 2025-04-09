//
//  ShopViewModel.swift
//  Starbuck
//
//  Created by 송승윤 on 4/10/25.
//
import SwiftUI

// MARK: - ViewModel
class ShopViewModel: ObservableObject {
    @Published var bannerImages: [String]
    @Published var allProducts: [ShopItem]
    @Published var bestItems: [ShopItem]
    @Published var newProducts: [ShopItem]
    
    init() {
        // Banner Images
        self.bannerImages = (1...3).map { "shopTopBanner\($0)" }
        
        // All Products
        self.allProducts = (1...6).map { index in
            let names = ["텀블러", "커피 용품", "선물 세트", "보온병", "머그", "액세서리"]
            return ShopItem(id: index,
                          imageName: "shopProduct\(index)",
                          name: names[index - 1],
                          volume: nil)
        }
        
        // Best Items
        self.bestItems = (31...38).map { index in
            ShopItem(id: index,
                    imageName: "shop\(index)",
                    name: "그린 사이렌 클래식 머그",
                    volume: "355ml")
        }
        
        // New Products
        self.newProducts = (41...44).map { index in
            ShopItem(id: index,
                    imageName: "shop\(index)",
                    name: "그린 사이렌 도트 머그",
                    volume: "237ml")
        }
    }
}


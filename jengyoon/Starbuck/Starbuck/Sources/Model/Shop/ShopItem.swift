//
//  ShopModel.swift
//  Starbuck
//
//  Created by 송승윤 on 4/10/25.
//

import Foundation

/// 상품 정보를 담는 구조체
struct ShopItem: Identifiable {
    let id: UUID
    let imageName: String
    let name: String
    let volume: String?    // 용량 정보 (옵셔널)
    
    /// 용량 표시가 필요한지 여부
    var shouldShowVolume: Bool {
        return volume != nil
    }
    
    init(imageName: String, name: String, volume: String? = nil) {
        self.id = UUID()
        self.imageName = imageName
        self.name = name
        self.volume = volume
    }
} 
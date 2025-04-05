//
//  HomeViewModel.swift
//  VienStarbucks
//
//  Created by 이은정 on 4/2/25.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    // 추천 커피 데이터
    @Published var recommendCoffee: [CoffeeRecommendModel] = [
        CoffeeRecommendModel(imageName: "EspressoConfana", name: "에스프레소 콘파냐"),
        CoffeeRecommendModel(imageName: "EspressoMacchiato", name: "에스프레소 마키아또"),
        CoffeeRecommendModel(imageName: "IceCafeAmericano", name: "아이스 카페 아메리카노"),
        CoffeeRecommendModel(imageName: "CafeAmericano", name: "카페 아메리카노"),
        CoffeeRecommendModel(imageName: "IceCaramelMacchiato", name: "아이스 카라멜 마키아또"),
        CoffeeRecommendModel(imageName: "CaramelMacchiato", name: "카라멜 마키아또")
    ]
    
    // 디저트/빵 데이터
    @Published var desertBread: [DesertBreadModel] = [
        DesertBreadModel(imageName: "Croissant", name: "너티 크루아상"),
        DesertBreadModel(imageName: "SpicyBulgogi", name: "매콤 소시지 불고기"),
        DesertBreadModel(imageName: "MiniLeafPie", name: "미니 리프 파이"),
        DesertBreadModel(imageName: "PanOChocola", name: "빵 오 쇼콜라"),
        DesertBreadModel(imageName: "SausageLeafPie", name: "소시지 리프 파이")
    ]
    
    // What's New 섹션
    @Published var whatsNewItems: [WhatsNewItemModel] = [
        WhatsNewItemModel(
            imageName: "WhatsNew1",
            title: "25년 3월 일회용컵 없는 날 캠페인",
            subtitle: "매월 10일은 일회용컵 없는 날! 스타벅스 에모매장에서 개인컵 및 다회용 컵을 이용하세요."
        ),
        WhatsNewItemModel(
            imageName: "WhatsNew2",
            title: "스타벅스 ooo점을 찾습니다",
            subtitle: "스타벅스 커뮤니티 스토어 파트너를 웅영할 기관을 공모합니다."
        ),
        WhatsNewItemModel(
            imageName: "WhatsNew3",
            title: "2월 8일, 리저브 스프링 신규 커피 출시",
            subtitle: "산뜻하고 달콤한 풍미가 가득한 리저브를 맛보세요."
        )
    ]
    
}

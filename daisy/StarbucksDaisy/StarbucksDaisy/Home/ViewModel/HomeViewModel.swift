//
//  HomeViewModel.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 4/3/25.
//

import Foundation
import SwiftUI

@Observable
class HomeViewModel {
    var recommendedMenus = [
        RecommendedMenu(name: "에스프레소 콘 파나", imagename: "coffee1"),
        RecommendedMenu(name: "에스프레소 마키아또", imagename: "coffee2"),
        RecommendedMenu(name: "아이스 카페 아메리카노", imagename: "coffee3"),
        RecommendedMenu(name: "카페 아메리카노", imagename: "coffee4"),
        RecommendedMenu(name: "아이스 카라멜 마키아또", imagename: "coffee5"),
        RecommendedMenu(name: "카라멜 마키아또", imagename: "coffee6")
    ]
    
    var newsLists = [
        News(title: "25년 3월 일회용컵 없는 날 캠페..", content: "매월 10일은 일회용컵 없는 날! 스타벅스 에모매장에서 개인컵 및 다회용 컵을 이용하세요.", thumbnail: "news1"),
        News(title: "스타벅스 ooo점을 찾습니다", content: "스타벅스 커뮤니티 스토어 파트너를 운영할 기관을 공모합니다.", thumbnail: "news2"),
        News(title: "2월 8일, 리저브 스프링 신규 커...", content: "산뜻하고 달콤한 풍미가 가득한 리저브를 맛보세요.", thumbnail: "news3")
    ]
    
    var dessertsLists = [
        Dessert(name: "너티 크루아상", image: "dessert1"),
        Dessert(name: "매콤 소시지 불고기", image: "dessert2"),
        Dessert(name: "미니 리프 파이", image: "dessert3"),
        Dessert(name: "뺑 오 쇼콜라", image: "dessert4"),
        Dessert(name: "소시지&올리브 파이", image: "dessert5")
    ]
}

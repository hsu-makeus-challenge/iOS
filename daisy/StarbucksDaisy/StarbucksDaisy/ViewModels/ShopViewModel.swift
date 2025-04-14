//
//  ShopViewModel.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 4/9/25.
//

import Foundation
import SwiftUI

@Observable
class ShopViewModel {
    var ProductTypes = [
        Product(name: "텀블러", imageName: "tumbler"),
        Product(name: "커피 용품", imageName: "coffeeItem"),
        Product(name: "선물세트", imageName: "giftset"),
        Product(name: "보온병", imageName: "thermos"),
        Product(name: "머그/컵", imageName: "mug-cup"),
        Product(name: "라이프스타일", imageName: "lifestyle")
    ]
    
    var BestItems = [
        NewProduct(name: "그린 사이렌 슬리브 머그", imageName: "bestItem1", volume: "355ml"),
        NewProduct(name: "그린 사이렌 클래식 머그", imageName: "bestItem2", volume: "355ml"),
        NewProduct(name: "사이렌 머그 앤 우드 소서", imageName: "bestItem3", volume: ""),
        NewProduct(name: "리저브 골드 테일 머그", imageName: "bestItem4", volume: "355ml"),
        NewProduct(name: "블랙 앤 골드 머그", imageName: "bestItem5", volume: "473ml"),
        NewProduct(name: "블랙 링 머그", imageName: "bestItem6", volume: "355ml"),
        NewProduct(name: "북청사자놀음 데미머그", imageName: "bestItem7", volume: "89ml"),
        NewProduct(name: "서울 제주 데미머그 세트", imageName: "bestItem8", volume: "")
    ]
    
    var NewProducts = [
        NewProduct(name: "그린 사이렌 도트 머그", imageName: "greenMug-237", volume: "237ml"),
        NewProduct(name: "그린 사이렌 도트 머그", imageName: "greenMug-355", volume: "355ml"),
        NewProduct(name: "홈 카페 미니 머그 세트", imageName: "miniMugSet", volume: ""),
        NewProduct(name: "홈 카페 글라스 세트", imageName: "glassSet", volume: "")
    ]
}

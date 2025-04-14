import SwiftUI
import Combine

class ShopViewModel: ObservableObject {
    let banners: [Banner] = [
        Banner(imageName: "banner1"),
        Banner(imageName: "banner2"),
        Banner(imageName: "banner3")
    ]
    
    let allProducts: [Product] = [
        Product(name: "텀블러", image: "tumbler", ml: ""),
        Product(name: "커피 용품", image: "coffeething", ml: ""),
        Product(name: "선물세트", image: "presentset", ml: ""),
        Product(name: "보온병", image: "warmbottle", ml: ""),
        Product(name: "머그/컵", image: "mug", ml: ""),
        Product(name: "라이프스타일", image: "lifestyle", ml: "")
    ]
    
    let bestItemsPages: [[Product]] = [
        // 페이지 1
        [
            Product(name: "그린 사이렌 슬리브 머그", image: "GreenSirenSleeveMug", ml: "355ml"),
            Product(name: "그린 사이렌 클래식 머그", image: "GreenSirenClassicMug", ml: "355ml"),
            Product(name: "사이렌 머그 & 우드 소서", image: "SirenMugAndWood", ml: ""),
            Product(name: "리저브 골드 테일 머그", image: "ReserveGoldTailMug", ml: "355ml")
        ],
        // 페이지 2
        [
            Product(name: "블랙 앤 골드 머그", image: "BlackAndGoldMug", ml: "473ml"),
            Product(name: "블랙 링 머그", image: "BlackRingMug", ml: "355ml"),
            Product(name: "서울 제주 데미 머그 세트", image: "SeoulJejuDemiMugSet", ml: "89ml"),
            Product(name: "라이언 머그", image: "LionMug", ml: "")
        ]
    ]
    
    // let으로 썼을때 (데이터가 바뀔일이 없다면) 효율이 더 좋음
    let newProducts: [Product] = [
        Product(name: "그린 사이렌 도트 머그", image: "GreenSirenDotMug237", ml: "237ml"),
        Product(name: "그린 사이렌 도트 머그", image: "GreenSirenDotMug355", ml: "355ml"),
        Product(name: "홈 카페 미니 머그 세트", image: "HomeCafeMiniMugSet", ml: ""),
        Product(name: "홈 카페 글라스 세트", image: "HomeCafeGlassSet", ml: "")
    ]
}

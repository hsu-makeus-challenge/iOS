//
//  CoffeeViewModel.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import Foundation

class CoffeeViewModel: ObservableObject {
    @Published var coffees: [CoffeeModel] = [
        CoffeeModel(title: "아이스 카라멜 마끼아또", englishName: "Iced Caramel Macchiato", imageName: "caramelcold", discription: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료", price: 6100, temperatureType: .iced),
        CoffeeModel(title: "카라멜 마끼아또", englishName: "Caramel Macchiato", imageName: "caramelHot", discription: "향긋한 바닐라 시럽과 따뜻한 스팀 밀크 위에 풍성한 우유 거품을 얹고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료", price: 6100, temperatureType: .hot),
        CoffeeModel(title: "아이스 카페 아메리카노", englishName: "Iced Caffe Americano", imageName: "americanoIce", discription: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피", price: 4700, temperatureType: .iced),
        CoffeeModel(title: "카페 아메리카노", englishName: "Caffe Americano", imageName: "americanoHot", discription: "진한 에스프레소와 뜨거운 물을 섞어 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽게 잘 느낄 수 있는 커피", price: 4700, temperatureType: .hot),
        CoffeeModel(title: "에스프레소 콘파나", englishName: "Espresso Con Panna", imageName: "confana", discription: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료", price: 4100, temperatureType: .icedOnly),
        CoffeeModel(title: "에스프레소 마키아또", englishName: "Espresso Macchiato", imageName: "macchiato", discription: "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로서, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료", price: 3900, temperatureType: .hotOnly)
    ]
    
    /// 커피 이름을 기준으로 Coffees 배열에서 해당 이름을 가진 CoffeeModel 객체를 찾아서 반환해주는 역할을 한다.
    /// - HomeViewModel에서 커피의 이름만 전달해주므로 커피이름을 받아와 표시해야 할 올바른 정보 랜더링
    /// - first(where:) : 배열의 특정 요소를 찾는 메서드인데 반드시 옵셔널 타입을 반환해야 한다.
    func coffee(for name: String) -> CoffeeModel? {
        coffees.first(where: { $0.title == name })
    }
}

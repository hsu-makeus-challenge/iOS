import Foundation

class CoffeeDetailViewModel: ObservableObject {

    let coffeeDetails: [String: CoffeeDetailModel] = [
        "아이스 카라멜 마키아또": CoffeeDetailModel(
            imageName: "square_caramelIce",
            nameKr: "아이스 카라멜 마키아또",
            nameEn: "Iced Caramel Macchiato",
            description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
            price: "6,100원"
        ),
        "카라멜 마키아또": CoffeeDetailModel(
            imageName: "square_caramelHot",
            nameKr: "카라멜 마키아또",
            nameEn: "Caramel Macchiato",
            description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
            price: "6,100원"
        ),
        "아이스 카페 아메리카노": CoffeeDetailModel(
            imageName: "square_americanoIce",
            nameKr: "아이스 카페 아메리카노",
            nameEn: "Iced Caffe Americano",
            description: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피",
            price: "4,700원"
        ),
        "카페 아메리카노": CoffeeDetailModel(
            imageName: "square_americanoHot",
            nameKr: "카페 아메리카노",
            nameEn: "Iced Caffe Americano",
            description: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피",
            price: "4,700원"
        ),
        "에스프레소 콘파냐": CoffeeDetailModel(
            imageName: "square_confana",
            nameKr: "에스프레소 콘파냐",
            nameEn: "Espresso Con Panna",
            description: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료",
            price: "4,100원"
        ),"에스프레소 마키아또": CoffeeDetailModel(
            imageName: "square_macchiato",
            nameKr: "에스프레소 마키아또",
            nameEn: "Caramel Macchiato",
            description: "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로서, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료",
            price: "3,900원"
        ),
    ]
    
    func detail(for name: String) -> CoffeeDetailModel? {
        return coffeeDetails[name]
    }
}

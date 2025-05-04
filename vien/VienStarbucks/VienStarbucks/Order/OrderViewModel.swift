
import Foundation
import SwiftUI

class OrderViewModel: ObservableObject {
    @Published var selectedMenuTab: MenuTab = .total
    @Published var menuItems: [MenuItem] = [
        MenuItem(name: "추천", description: "Recommend", imageName: "recommend"),
        MenuItem(name: "아이스 카페 아메리카노", description: "Reserve Espresso", imageName: "ReserveEspresso"),
        MenuItem(name: "카페 아메리카노", description: "Reserve Drip", imageName: "ReserveDrip"),
        MenuItem(name: "카푸치노", description: "Dcaf Coffee", imageName: "DcafCoffee"),
        MenuItem(name: "아이스 카푸치노", description: "Espresso", imageName: "Espresso"),
        MenuItem(name: "카라멜 마키아또", description: "Blonde Coffee", imageName: "BlondeCoffee"),
        MenuItem(name: "아이스 카라멜 마키아또", description: "Cold Brew", imageName: "ColdBrew"),
        MenuItem(name: "아포가토/기타", description: "Others", imageName: "Others"),
        MenuItem(name: "럼 샷 코르타도", description: "Brewed Coffee", imageName: "BrewedCoffee9"),
        MenuItem(name: "라벤더 카페 브레베", description: "Teavana", imageName: "Teavana"),
        MenuItem(name: "병음료", description: "RTD", imageName: "RTD"),
    ]
}

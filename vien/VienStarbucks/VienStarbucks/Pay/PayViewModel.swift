import SwiftUI

class PayViewModel: ObservableObject {
    @Published var cards: [PayModel] = [
        PayModel(cardName: "아무카드 A", balance: 999, cardNumber: "****-****-1234", expireTime: "03:00", imageName: "pay/StarbucksCard"),
        PayModel(cardName: "아무카드 B", balance: 10000, cardNumber: "****-****-5678", expireTime: "04:00", imageName: "pay/StarbucksCard")
    ]
}

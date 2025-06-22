import SwiftUI

struct PayModel: Identifiable {
    let id = UUID()
    var cardName: String
    var balance: Int
    var cardNumber: String
    var expireTime: String
    var imageName: String
}

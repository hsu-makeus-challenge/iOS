import Foundation

struct CoffeeDetailModel: Identifiable {
    let id = UUID()
    let imageName: String
    let nameKr: String
    let nameEn: String
    let description: String
    let price: String
}

import Foundation

struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
}

enum MenuTab: String, CaseIterable {
    case total = "전체 메뉴"
    case personal = "나만의 메뉴"
    case cake = "홀케이크 예약"
}

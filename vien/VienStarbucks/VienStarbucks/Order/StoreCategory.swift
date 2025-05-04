import Foundation

enum StoreCategory: String, CaseIterable {
    case reserve = "리저브"
    case dt = "DT"
    case none = ""

    init(from category: String?) {
        guard let cat = category else {
            self = .none
            return
        }
        if cat.contains("리저브") {
            self = .reserve
        } else if cat.contains("DT") {
            self = .dt
        } else {
            self = .none
        }
    }

    var tag: String? {
        switch self {
        case .reserve: return "R"
        case .dt: return "D"
        case .none: return nil
        }
    }
}

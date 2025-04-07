import Foundation

struct WhatsNewItemModel: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
}

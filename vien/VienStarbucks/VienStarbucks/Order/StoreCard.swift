
import SwiftUI

struct StoreCard: View {
    let store: Store

    var body: some View {
        HStack(alignment: .top) {
            Image(store.imageName)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(6)

            VStack(alignment: .leading, spacing: 4) {
                Text(store.name)
                    .font(.headline)
                Text(store.address)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                HStack(spacing: 6) {
                    if let tag = store.category.tag {
                        Text(tag)
                            .font(.caption2)
                            .bold()
                            .padding(.vertical, 2)
                            .padding(.horizontal, 6)
                            .background(badgeColor(for: tag))
                            .foregroundColor(.white)
                            .cornerRadius(4)
                    }
                }
            }

            Spacer()

            Text(store.distanceText)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }

    func badgeColor(for tag: String) -> Color {
        switch tag {
        case "R": return .brown
        case "D": return .green
        default: return .gray
        }
    }
}

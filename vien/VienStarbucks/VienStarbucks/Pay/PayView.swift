import SwiftUI

struct PayView: View {
    @StateObject private var viewModel = PayViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Pay")
                .font(.largeTitle.bold())
                .padding(.leading, 20)

            CustomPagingSlider(data: $viewModel.cards) { $item in
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 150)
                    .cornerRadius(10)
            } titleContent: { $item in
                VStack(spacing: 8) {
                    Text(item.cardName)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text("\(item.balance)원")
                        .font(.title2.bold())

                    Text(item.cardNumber)
                        .font(.caption)
                        .foregroundColor(.gray)

                    Text("카드 유효 시간 \(item.expireTime)")
                        .font(.caption2)
                        .foregroundColor(.green)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(height: 260)
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top)
    }
}

#Preview {
    PayView()
}

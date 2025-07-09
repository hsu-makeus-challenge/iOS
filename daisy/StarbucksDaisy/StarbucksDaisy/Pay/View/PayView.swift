//
//  PayView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct PayView: View {
    @State private var activeID = payCards.first?.id
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Pay")
                    .font(.mainTextBold24)
                
                CustomCarousel(config: .init(hasOpacity: false, hasScale: true), selection: $activeID, data: payCards) { item in
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(height: 150)
                
                // 현재 선택된 카드 정보 출력
                if let selectedCard = payCards.first(where: { $0.id == activeID }) {
                    VStack(spacing: 8) {
                        Text(selectedCard.cardName)
                            .font(.mainTextMedium12)
                            .foregroundStyle(.gray06)
                        Text("\(selectedCard.balance)원")
                            .font(.mainTextSemiBold18)
                        Text("\(selectedCard.maskedCardNumber)")
                    }
                    .font(.body)
                } else {
                    Text("카드를 선택해주세요")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    PayView()
}

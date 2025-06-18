//
//  PayView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 6/18/25.
//

import SwiftUI
import SwiftData

struct PayView: View {
    @Query(
        sort: \PayCard.createdAt,
        order: .forward
    ) var payCards: [PayCard]
    @Environment(\.modelContext) private var context
    @State private var activeID: UUID?
    
    var body: some View {
        VStack {
            PayHeaderView()
            
            Spacer().frame(height: 25)
            
            CustomCarousel(
                config: .init(hasOpacity: false, hasScale: true),
                selection: $activeID,
                data: payCards
            ) { item in
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(height: 150)
        }
        .onAppear {
            if payCards.isEmpty {
                insertInitialCards()
            }
        }
    }
    
    private func insertInitialCards() {
        let defaultCards = [
            PayCard(
                image: "Pay/payCard 1",
                cardName: "아무카드A",
                balance: 999,
                cardNumber: "123412341234"
            ),
            PayCard(
                image: "Pay/payCard 2",
                cardName: "아무카드B",
                balance: 12000,
                cardNumber: "123456789123"
            )
        ]
        
        for card in defaultCards {
            context.insert(card)
        }
    }
}

fileprivate struct PayHeaderView: View {
    fileprivate var body: some View {
        HStack {
            Text("Pay")
                .font(.mainTextBold20)
            
            Spacer()
            
            Image("Pay/plus")
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    PayView()
        .modelContainer(for: PayCard.self, inMemory: true)
}

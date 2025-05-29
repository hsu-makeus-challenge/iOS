//
//  PayView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct PayView: View {
    @State private var activeID: UUID?
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
            }
        }
    }
}

#Preview {
    PayView()
}

//
//  ShopView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/9/25.
//

import SwiftUI

struct ShopView: View {
    @State private var shopViewModel: ShopViewModel = .init()
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                OnlineStoreView(shopViewModel: shopViewModel)
            }
            .padding(.horizontal, 16)
        }
    }
}

fileprivate struct OnlineStoreView: View {
    @Bindable private var shopViewModel: ShopViewModel
    
    init(shopViewModel: ShopViewModel) {
        self.shopViewModel = shopViewModel
    }
    
    fileprivate var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Starbucks Online Store")
                .font(.mainTextBold24)
                .foregroundStyle(.black)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(
                        shopViewModel.shopModel.onlineStoreBanner,
                        id: \.id
                    ) { onlineStore in
                        Image("\(onlineStore.imageName)")
                            .resizable()
                            .frame(width: 270, height: 216)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ShopView()
}

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
            LazyVStack(alignment: .leading, spacing: 31) {
                OnlineStoreView(shopViewModel: shopViewModel)
                
                AllProductsView(shopViewModel: shopViewModel)
                
                BestProductsView(shopViewModel: shopViewModel)
                
                NewProductsView(shopViewModel: shopViewModel)
            }
            .padding(.horizontal, 16)
        }
        .background(Color(.white01))
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

fileprivate struct AllProductsView: View {
    @Bindable private var shopViewModel: ShopViewModel
    
    init(shopViewModel: ShopViewModel) {
        self.shopViewModel = shopViewModel
    }
    
    fileprivate var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("All Products")
                .font(.mainTextBold24)
                .foregroundStyle(.black)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 17) {
                    ForEach(
                        shopViewModel.shopModel.allProducts,
                        id: \.id
                    ) { product in
                        ProductCardView(product: product)
                    }
                }
            }
            .scrollIndicators(.never)
        }
    }
}

fileprivate struct BestProductsView: View {
    @Bindable private var shopViewModel: ShopViewModel
    
    init(shopViewModel: ShopViewModel) {
        self.shopViewModel = shopViewModel
    }
    
    private let columns: [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]
    
    fileprivate var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Best Products")
                .font(.mainTextBold24)
                .foregroundStyle(.black)
            
            ScrollView(.horizontal) {
                LazyVGrid(columns: columns, spacing: 54) {
                    ForEach(
                        shopViewModel.shopModel.bestProducts,
                        id:\.id
                    ) { product in
                        // TODO: 페이징 기능 추가
                        // MARK: 그리드 아이템 크기 동적으로 생성 필요(피그마처럼)
                        ProductCardView(product: product)
                    }
                }
                .padding(.horizontal, 14.5)
            }
            .scrollTargetBehavior(.paging)
        }
    }
}

fileprivate struct NewProductsView: View {
    @Bindable private var shopViewModel: ShopViewModel
    
    init(shopViewModel: ShopViewModel) {
        self.shopViewModel = shopViewModel
    }
    
    private let columns: [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]
    
    fileprivate var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Best Products")
                .font(.mainTextBold24)
                .foregroundStyle(.black)
            
            LazyVGrid(columns: columns, spacing: 54) {
                ForEach(
                    shopViewModel.shopModel.newProducts,
                    id:\.id
                ) { product in
                    ProductCardView(product: product)
                }
            }
            .padding(.horizontal, 14.5)
        }
    }
}

fileprivate struct ProductCardView: View {
    private var product: ShopItem
    
    init(product: ShopItem) {
        self.product = product
    }
    
    fileprivate var body: some View {
        VStack(spacing: 10) {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
            Text(product.name)
                .font(.mainTextSemiBold14)
                .foregroundStyle(Color(.black02))
        }
    }
}

#Preview {
    ShopView()
}

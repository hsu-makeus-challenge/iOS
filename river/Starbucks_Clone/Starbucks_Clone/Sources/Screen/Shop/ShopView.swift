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
                        makeProductCard(with: product)
                    }
                }
            }
            .scrollIndicators(.never)
        }
    }
    
    private func makeProductCard(
        with model: ShopItem
    ) -> some View {
        return VStack(spacing: 10) {
            Image(model.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
            Text(model.name)
                .font(.mainTextSemiBold14)
                .foregroundStyle(Color(.black02))
        }
    }
}

fileprivate struct BestProductsView: View {
    @Bindable private var shopViewModel: ShopViewModel
    @State private var currentPage: Int = 0
    
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
            
            TabView(selection: $currentPage) {
                ForEach(
                    shopViewModel.bestProductPages.indices,
                    id:\.self
                ) { index in
                    let pageItems = shopViewModel.bestProductPages[index]
                    makeGridLayout(with: pageItems)
                        .padding(.horizontal, 14.5)
                        .tag(index)
                }
            }
            .frame(height: 470)
            .tabViewStyle(.page)
            .indexViewStyle(
                .page(backgroundDisplayMode: .never)
            ) // 페이지 인디케이터
            
            customIndicator
            // 이 방법으로는 레이아웃이 명확하게 안 나눠지네..
//            ScrollView(.horizontal) {
//                LazyHStack {
//                    ForEach(
//                        shopViewModel.bestProductPages.indices,
//                        id:\.self
//                    ) { index in
//                        let pageItems = shopViewModel.bestProductPages[index]
//                        makeGridLayout(with: pageItems)
//                    }
//                }
//                .padding(.horizontal, 14.5)
//            }
//            .scrollTargetBehavior(.paging) // iOS 17부터 사용 가능
//            .frame(height: 470)
        }
    }
    
    private var customIndicator: some View {
        HStack(spacing: 6) {
            ForEach(
                0..<shopViewModel.bestProductPages.count,
                id: \.self
            ) { index in
                Circle()
                    .fill(
                        currentPage == index
                        ? Color.black
                        : Color.gray.opacity(0.3)
                    )
                    .frame(width: 8, height: 8)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
    }
    
    private func makeGridLayout(
        with model: PaginationShopItem
    ) -> some View {
        return LazyVGrid(columns: columns) {
            ForEach(
                model.items,
                id: \.id
            ) { product in
                ProductCardView(
                    product: product,
                    width: 157,
                    height: 208
                )
            }
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
            Text("New Products")
                .font(.mainTextBold24)
                .foregroundStyle(.black)
            
            LazyVGrid(columns: columns, spacing: 54) {
                ForEach(
                    shopViewModel.shopModel.newProducts,
                    id:\.id
                ) { product in
                    ProductCardView(
                        product: product,
                        width: 157,
                        height: 208
                    )
                }
            }
            .padding(.horizontal, 14.5)
        }
    }
}

fileprivate struct ProductCardView: View {
    private var product: ShopItem
    private var width: CGFloat
    private var height: CGFloat
    
    init(
        product: ShopItem,
        width: CGFloat,
        height: CGFloat
    ) {
        self.product = product
        self.width = width
        self.height = height
    }
    
    fileprivate var body: some View {
        VStack(spacing: 10) {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
            
            Text(product.name)
                .font(.mainTextSemiBold14)
                .foregroundStyle(Color(.black02))
        }
        .frame(width: width, height: height)
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        devicePreviews {
            ShopView()
        }
    }
}

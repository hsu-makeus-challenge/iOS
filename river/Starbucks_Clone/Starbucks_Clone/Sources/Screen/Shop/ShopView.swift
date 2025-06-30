//
//  ShopView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/9/25.
//

import SwiftUI

struct ShopView: View {
    @State private var shopViewModel: ShopViewModel = .init()
    @State var headerOffsets: (CGFloat, CGFloat) = (0, 0)
    
    var body: some View {
        ScrollView(.vertical, content: {
            VStack(spacing: 0) {
                headerView()
                
                LazyVStack(alignment: .leading, spacing: 33, pinnedViews: [.sectionHeaders], content: {
                    Section(content: {
                        LazyVStack(alignment: .leading, spacing: 31) {
                            OnlineStoreView(shopViewModel: shopViewModel)
                            
                            AllProductsView(shopViewModel: shopViewModel)
                            
                            BestProductsView(shopViewModel: shopViewModel)
                            
                            NewProductsView(shopViewModel: shopViewModel)
                        }
                        .padding(.horizontal, 16)

                    }, header: {
                        pinnedHeaderView()
                            .modifier(OffsetModifier(offset: $headerOffsets.0, returnromStart: false))
                            .modifier(OffsetModifier(offset: $headerOffsets.1))
                    })
                })
                .safeAreaPadding(.horizontal, 16)
                .contentMargins(.top, 20)
                .padding(.bottom, 100)
            }
            
        })
        .ignoresSafeArea()
        .coordinateSpace(name: "SCROLL")
        .background(Color(.white01))
    }
    
    @ViewBuilder
    private func headerView() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let size = proxy.size
            let height = max(0, size.height + minY)
            
            Rectangle()
                .fill(Color.white)
                .frame(width: size.width, height: height, alignment: .top)
                .offset(y: -minY)
        }
        .frame(height: 20)
    }
    
    @ViewBuilder
    private func pinnedHeaderView() -> some View {
        
        let threshhold = -(getScreenSize().height * 0.05)
        
        HStack {
            if headerOffsets.0 < threshhold {
                Spacer()
            }
            
            Text("Starbucks Online Store")
                .foregroundStyle(.black)
                .font(headerOffsets.0 < threshhold ? .mainTextBold20 : .mainTextBold24)
                .animation(.easeInOut(duration: 0.2), value: headerOffsets.0 < threshhold)
            
            Spacer()
            
        }
        .frame(height: 90, alignment: .bottomLeading)
        .safeAreaPadding(.bottom, headerOffsets.0 < threshhold ? 20 : 0)
        .background(Color.white)
    }
}

fileprivate struct OnlineStoreView: View {
    @Bindable private var shopViewModel: ShopViewModel
    
    init(shopViewModel: ShopViewModel) {
        self.shopViewModel = shopViewModel
    }
    
    fileprivate var body: some View {
        VStack(alignment: .leading, spacing: 16) {
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
            
            // 전체 화면의 width를 측정하기 위해 바깥쪽 GeometryReader 사용
            GeometryReader { geometry in
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(
                            shopViewModel.bestProductPages.indices,
                            id: \.self
                        ) { index in
                            let pageItems = shopViewModel.bestProductPages[index]
                            
                            pagedGridView(
                                for: pageItems,
                                index: index,
                                in: geometry
                            )
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.never)
            }
            .frame(height: 470)
            
            customIndicator
        }
    }
    
    /// ScrollView + GeometryReader 조합한 페이징 탭뷰
    ///
    ///     TabView(.page) 대신  조합을 사용한 이유:
    ///     - TabView는 페이징이 간편하지만, 기본 제공되는 PageIndicator만 사용 가능하고,
    ///     커스텀 인디케이터(모양, 위치, 애니메이션 등)를 적용하기 어렵다.
    ///     - 반면 ScrollView를 직접 구성하면 사용자가 보고 있는 페이지를 직접 계산하여
    ///     다양한 형태의 커스텀 인디케이터를 구현할 수 있다.
    ///     - 이 함수에서는 각 페이지의 위치(minX)를 기반으로 현재 페이지를 계산하고,
    ///     currentPage를 업데이트하여 인디케이터와 연동한다.
    private func pagedGridView(
        for pageItems: PaginationShopItem,
        index: Int,
        in containerGeo: GeometryProxy
    ) -> some View {
        // 각 페이지의 위치를 추적하기 위한 GeometryReader
        return GeometryReader { geo in
            makeGridLayout(with: pageItems)
                // 한 페이지에 들어갈 너비를 지정 (좌우 패딩 고려)
                .frame(width: containerGeo.size.width - 30)
                .padding(.horizontal, 14.5)
                // 뷰의 위치(minX)가 변경될 때마다 호출됨 (스크롤 시 감지)
                .onChange(of: geo.frame(in: .global).minX) { _, minX in
                    // 한 페이지의 기준 너비
                    let pageWidth = containerGeo.size.width - 30
                    // 왼쪽으로 스크롤되면 minX가 작아지므로 -를 붙여 양수로 만듦
                    let offset = -minX
                    // 현재 보고 있는 페이지 계산(반올림)
                    let calculatedPage = Int(round(offset / pageWidth))
                    
                    // 계산된 페이지가 기존 currentPage와 다를 경우 업데이트
                    if currentPage != calculatedPage {
                        currentPage = calculatedPage
                    }
                }
        }
        // 스크롤 단위로 정확히 인식시키기 위해 각 페이지 뷰의 너비를 고정
        .frame(width: containerGeo.size.width)
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

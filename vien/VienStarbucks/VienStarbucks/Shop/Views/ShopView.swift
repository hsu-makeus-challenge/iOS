//import SwiftUI
//
//struct ShopView: View {
//    @StateObject private var viewModel = ShopViewModel()
//    
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 20) {
//                BannerScrollView(banners: viewModel.banners)
//
//                Text("All Products")
//                    .font(.title2).bold()
//                AllProductsView(products: viewModel.allProducts)
//                
//                Text("Best Items")
//                    .font(.title2).bold()
//                BestItemsPagerView(pagedItems: viewModel.bestItemsPages)
//                
//                Text("New Products")
//                    .font(.title2).bold()
//                NewProductsGridView(products: viewModel.newProducts)
//            }
//            .padding(.horizontal, 19)
//        }
//        .navigationTitle("Starbucks Online Store")
//    }
//}
//
//
//
//struct BannerScrollView: View {
//    let banners: [Banner]
//    
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            LazyHStack(spacing:28) {
//                ForEach(banners) { banner in
//                    Image(banner.imageName)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 270, height: 216)
//                }
//            }
//            .padding(.horizontal)
//        }
//    }
//}
//
//
//struct AllProductsView: View {
//    let products: [Product]
//    
//    var body: some View {
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 17) {
//                ForEach(products) { product in
//                    VStack {
//                        Image(product.image)
//                            .resizable()
//                            .frame(width: 80, height: 80)
//                        Text(product.name)
//                            .font(.caption)
//                    }
//                }
//            }
//            .padding(.horizontal)
//        }
//    }
//}
//
//
//struct BestItemsPagerView: View {
//    var pagedItems: [[Product]]
//    @State private var currentPage = 0
//    
//    var body: some View {
//        TabView(selection: $currentPage) {
//            ForEach(0..<pagedItems.count, id: \.self) { index in
//                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 20) {
//                    ForEach(pagedItems[index]) { product in
//                        ProductCard(product: product)
//                    }
//                }
//                .tag(index)
//                .padding(.horizontal)
//            }
//        }
//        .frame(height: 300)
//        .tabViewStyle(.page(indexDisplayMode: .automatic))
//    }
//}
//
//struct NewProductsGridView: View {
//    let products: [Product]
//    
//    let columns = [GridItem(.flexible()), GridItem(.flexible())]
//    
//    var body: some View {
//        LazyVGrid(columns: columns, spacing: 20) {
//            ForEach(products) { product in
//                ProductCard(product: product)
//            }
//        }
//        
//    }
//}
//
//#Preview {
//    ShopView()
//}

import SwiftUI

struct ShopView: View {
    @StateObject private var viewModel = ShopViewModel()
    @State private var headerOffsets: (CGFloat, CGFloat) = (0, 0)
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 0) {
                headerView()
                
                LazyVStack(spacing: 25, pinnedViews: [.sectionHeaders]) {
                    Section(header: stickyHeaderView()) {
                        BannerScrollView(banners: viewModel.banners)

                        Group {
                            Text("All Products")
                                .font(.title2).bold()
                            AllProductsView(products: viewModel.allProducts)
                        }

                        Group {
                            Text("Best Items")
                                .font(.title2).bold()
                            BestItemsPagerView(pagedItems: viewModel.bestItemsPages)
                        }

                        Group {
                            Text("New Products")
                                .font(.title2).bold()
                            NewProductsGridView(products: viewModel.newProducts)
                        }
                    }
                }
                .padding(.horizontal, 19)
            }
        }
        .coordinateSpace(name: "SCROLL")
        .ignoresSafeArea()
        .background(Color.white)
    }

    private func headerView() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let height = max(0, proxy.size.height + minY)

            Color.white
                .frame(height: height)
                .offset(y: -minY)
        }
        .frame(height: 20)
    }

    private func stickyHeaderView() -> some View {
        let threshold = -(getScreenSize().height * 0.05)

        return HStack {
            if headerOffsets.0 < threshold {
                Spacer()
            }

            Text("Starbucks Online Store")
                .font(headerOffsets.0 < threshold ? .title : .title2)
                .fontWeight(.bold)
                .animation(.easeInOut(duration: 0.3), value: headerOffsets.0)

            Spacer()
        }
        .frame(height: 90)
        .padding(.bottom, headerOffsets.0 < threshold ? 10 : 0)
        .background(Color.white)
        .modifier(OffsetModifier(offset: $headerOffsets.0, returnromStart: false))
        .modifier(OffsetModifier(offset: $headerOffsets.1))
        .zIndex(10)
    }
}



struct BannerScrollView: View {
    let banners: [Banner]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing:28) {
                ForEach(banners) { banner in
                    Image(banner.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 270, height: 216)
                }
            }
            .padding(.horizontal)
        }
    }
}


struct AllProductsView: View {
    let products: [Product]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 17) {
                ForEach(products) { product in
                    VStack {
                        Image(product.image)
                            .resizable()
                            .frame(width: 80, height: 80)
                        Text(product.name)
                            .font(.caption)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}


struct BestItemsPagerView: View {
    var pagedItems: [[Product]]
    @State private var currentPage = 0

    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(0..<pagedItems.count, id: \.self) { index in
                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 20) {
                    ForEach(pagedItems[index]) { product in
                        ProductCard(product: product)
                    }
                }
                .tag(index)
                .padding(.horizontal)
            }
        }
        .frame(height: 300)
        .tabViewStyle(.page(indexDisplayMode: .automatic))
    }
}

struct NewProductsGridView: View {
    let products: [Product]

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(products) { product in
                ProductCard(product: product)
            }
        }

    }
}

#Preview {
    ShopView()
}

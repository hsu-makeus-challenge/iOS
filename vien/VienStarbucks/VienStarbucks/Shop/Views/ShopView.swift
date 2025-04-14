import SwiftUI

struct ShopView: View {
    @StateObject private var viewModel = ShopViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                BannerScrollView(banners: viewModel.banners)

                Text("All Products")
                    .font(.title2).bold()
                AllProductsView(products: viewModel.allProducts)
                
                Text("Best Items")
                    .font(.title2).bold()
                BestItemsPagerView(pagedItems: viewModel.bestItemsPages)
                
                Text("New Products")
                    .font(.title2).bold()
                NewProductsGridView(products: viewModel.newProducts)
            }
            .padding(.horizontal, 19)
        }
        .navigationTitle("Starbucks Online Store")
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

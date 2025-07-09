//
//  ShopView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct ShopView: View {
    /// Best Items 섹션의 현재 페이지 상태를 추적
    @State private var currentBestItemPage = 0
    @State var headerOffsets: (CGFloat, CGFloat) = (0, 0)
    
    var viewModel: ShopViewModel = .init()
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            headerView()
            LazyVStack(spacing: 20, pinnedViews: [.sectionHeaders], content: {
                Section(content: {
                    TopBanners
                    AllProducts
                    BestItems
                    NewProducts
                }, header: {
                    pinnedHeaderView()
                        .modifier(OffsetModifier(offset: $headerOffsets.0, returnromStart: false))
                        .modifier(OffsetModifier(offset: $headerOffsets.1))
                })
            })
        }
        .padding(.horizontal, 16)
        .safeAreaPadding(.bottom, 90)
        .ignoresSafeArea()
        .background(.white01)
        .scrollIndicators(.hidden)
        .coordinateSpace(name: "SCROLL")
    }
    
    private var TopBanners: some View {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 28) {
                    Image("shopBanner1")
                        .resizable().scaledToFit()
                    Image("shopBanner2")
                    Image("shopBanner3")
                }
            }
            .scrollIndicators(.hidden)
    }
    
    private var AllProducts: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("All Products")
                .font(.mainTextSemiBold22)
                .foregroundStyle(.black03)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 17) {
                    ForEach(viewModel.ProductTypes, id:\.id) { item in
                        Button(action: {
                            print("\(item.name) selected")
                        }, label: {
                            VStack(spacing: 10) {
                                Image(item.imageName)
                                Text(item.name)
                                    .font(.mainTextSemiBold13)
                                    .foregroundStyle(.black02)
                            }
                        })
                    }
                    
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
    private var BestItems: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Best Items")
                .font(.mainTextSemiBold22)
                .foregroundStyle(.black03)
            
            TabView(selection: $currentBestItemPage) {
                // 첫 번째 페이지 - 상위 4개 상품
                LazyVGrid(columns: columns, spacing: 45) {
                    ForEach(viewModel.BestItems.prefix(4)) { item in
                        VStack(alignment: .leading) {
                            Image(item.imageName)
                            Spacer().frame(height: 12)
                            Text(item.name)
                                .font(.mainTextSemiBold14)
                                .foregroundStyle(.black02)
                            Text(item.volume)
                                .font(.mainTextSemiBold14)
                                .foregroundStyle(.black02)
                        }
                    }
                }
                .tag(0)
                
                // 두 번째 페이지 - 하위 4개 상품
                LazyVGrid(columns: columns, spacing: 45) {
                    ForEach(viewModel.BestItems.suffix(4)) { item in
                        VStack(alignment: .leading) {
                            Image(item.imageName)
                            Spacer().frame(height: 12)
                            Text(item.name)
                                .font(.mainTextSemiBold14)
                                .foregroundStyle(.black02)
                            Text(item.volume)
                                .font(.mainTextSemiBold14)
                                .foregroundStyle(.black02)
                        }
                    }
                }
                .tag(1)
            }
            .tabViewStyle(.page)
            .frame(height: 470)
        }
    }
    
    private var NewProducts: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("New Products")
                .font(.mainTextSemiBold22)
                .foregroundStyle(.black03)
            
            LazyVGrid(columns: columns, spacing: 45) {
                ForEach(viewModel.NewProducts, id: \.id) { item in
                    Button(action: {
                        print("\(item.name) selected")
                    }, label: {
                        VStack(alignment: .leading) {
                            Image(item.imageName)
                            Spacer().frame(height: 12)
                            Text(item.name)
                                .font(.mainTextSemiBold14)
                                .foregroundStyle(.black02)
                            Text(item.volume)
                                .font(.mainTextSemiBold14)
                                .foregroundStyle(.black02)
                        }
                    })
                }
            }
            .frame(maxHeight: 446)
        }
    }
    
    @ViewBuilder
       private func headerView() -> some View {
           GeometryReader { proxy in
               let minY = proxy.frame(in: .named("SCROLL")).minY
               let size = proxy.size
               let height = max(0, size.height + minY)
               
               Rectangle()
                   .fill(Color.white01)
                   .frame(width: size.width, height: height, alignment: .top)
                   .offset(y: -minY)
           }
           .frame(height: 27)
       }

    @ViewBuilder
        private func pinnedHeaderView() -> some View {
            
            let threshhold = -(getScreenSize().height * 0.05)
            
            HStack {
                if headerOffsets.0 < threshhold {
                    Spacer()
                }
                
                Text("Starbucks Online Store")
                    .font(headerOffsets.0 < threshhold ? .mainTextBold16 : .mainTextBold24)
                    .animation(.easeInOut(duration: 0.2), value: headerOffsets.0)
                
                Spacer()
                
            }
            .frame(height: 90, alignment: .bottomLeading)
            .safeAreaPadding(.bottom, headerOffsets.0 < threshhold ? 16 : 0)
            .background(Color.white01)
        }
}

extension View {
    func getScreenSize() -> CGSize {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return windowScene.screen.bounds.size
    }
}

#Preview {
    ShopView()
}

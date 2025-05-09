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
    
    var viewModel: ShopViewModel = .init()
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TopBanners
                AllProducts
                BestItems
                NewProducts
            }
        }
        .padding(.horizontal, 16)
        .background(.white01)
        .scrollIndicators(.hidden)
    }
    
    private var TopBanners: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Starbucks Online Store")
                .font(.mainTextBold24)
            
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
        .padding(.top, 27)
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
}

#Preview {
    ShopView()
}

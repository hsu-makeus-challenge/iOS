//
//  ShopView.swift
//  Starbuck
//
//  Created by 송승윤 on 4/10/25.
//

import SwiftUI

/// 스타벅스 상품 페이지 메인 뷰
struct ShopView: View {
    // MARK: - Properties
    
    /// 상품 데이터를 관리하는 뷰모델
    @StateObject private var viewModel = ShopViewModel()
    /// Best Items 섹션의 현재 페이지 상태를 추적
    @State private var currentBestItemPage = 0
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                bannerSection      // 상단 배너 섹션
                allProductsSection // 전체 상품 카테고리 섹션
                bestItemsSection   // 베스트 상품 섹션
                newProductsSection // 신규 상품 섹션
            }
            .background(Color.white01)
        }
    }
    
    // MARK: - Banner Section
    /// 상단 배너 섹션 뷰
    /// - 가로 스크롤이 가능한 배너 이미지들을 표시
    /// - 각 배너는 전체 화면 너비에서 좌우 여백을 뺀 크기로 표시
    private var bannerSection: some View {
        VStack (alignment: .leading) {
            Text("Starbucks Online Store")
                .font(.PretendardBold24)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(viewModel.bannerImages, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - All Products Section
    /// 전체 상품 카테고리 섹션 뷰
    /// - 가로 스크롤이 가능한 상품 카테고리 목록을 표시
    /// - 각 카테고리는 아이콘과 이름으로 구성
    private var allProductsSection: some View {
        VStack(alignment: .leading) {
            Text("All Products")
                .font(.PretendardBold24)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(viewModel.allProducts) { product in
                        VStack {
                            Image(product.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text(product.name)
                                .font(.caption)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - Best Items Section
    /// 베스트 상품 섹션 뷰
    /// - TabView를 사용하여 페이지 형태로 상품을 표시
    /// - 각 페이지는 2x2 그리드 레이아웃으로 구성
    /// - 각 상품은 이미지, 이름, 용량 정보를 포함
    private var bestItemsSection: some View {
        VStack(alignment: .leading) {
            Text("Best Items")
                .font(.PretendardBold24)
                .padding(.horizontal)
            
            TabView(selection: $currentBestItemPage) {
                // 첫 번째 페이지 - 상위 4개 상품
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 20) {
                    ForEach(viewModel.bestItems.prefix(4)) { item in
                        VStack(alignment: .leading) {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text(item.name)
                                .font(.PretendardLight14)
                            if item.shouldShowVolume, let volume = item.volume {
                                Text(volume)
                                    .font(.PretendardLight14)
                                    .foregroundColor(.gray)
                            }
                            else {
                                Spacer().frame(height: 18)
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 50)
                .tag(0)
                
                // 두 번째 페이지 - 하위 4개 상품
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 20) {
                    ForEach(viewModel.bestItems.suffix(4)) { item in
                        VStack(alignment: .leading) {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text(item.name)
                                .font(.PretendardLight14)
                            if item.shouldShowVolume, let volume = item.volume {
                                Text(volume)
                                    .font(.PretendardLight14)
                                    .foregroundColor(.gray)
                            }
                            else {
                                // 빈 공간을 주어 높이 맞춤
                                Spacer().frame(height: 14)
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 50)
                .tag(1)
            }
            .frame(height: 520)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .tint(.black)
        }
    }
    
    // MARK: - New Products Section
    /// 신규 상품 섹션 뷰
    /// - 2열 그리드 레이아웃으로 신규 상품을 표시
    /// - 각 상품은 이미지, 이름, 용량 정보를 포함
    private var newProductsSection: some View {
        VStack(alignment: .leading) {
            Text("New Products")
                .font(.PretendardBold24)
                .padding(.horizontal)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 20) {
                ForEach(viewModel.newProducts) { product in
                    VStack(alignment: .leading) {
                        Image(product.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Text(product.name)
                            .font(.PretendardLight14)
                        if product.shouldShowVolume, let volume = product.volume {
                            Text(volume)
                                .font(.PretendardLight14)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom,20)
        }
    }
}

#Preview {
    ShopView()
}

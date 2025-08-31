//
//  HomeView.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import SwiftUI

struct HomeView: View {
    /// 관찰 가능한 객체를 HomeView에서 직접 생성후 소유한다.
    @StateObject private var viewModel = HomeViewModel()
    
    @State private var showAdvertisement = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, content: {
                LazyVStack(spacing: 20) {
                    HomeBannerView()
                    
                    HomeMenuView()
                    
                    Image(.eventBanner)
                    
                    Image(.serviceSuscibe)
                    
                    NewsView()
                    
                    homeBannerSet
                    
                    DesertView()
                    
                    homeBottomBannerset
                    
                    Spacer()
                } //: LazyVStack
            }) //:ScrollView
            .safeAreaPadding(.horizontal, 10)
            .ignoresSafeArea()
        } //: Navigation
        .onAppear {
            showAdvertisement = true
        }
        .sheet(isPresented: $showAdvertisement) {
            AdvertisementView()
        }
    }
    
    private var homeBannerSet: some View {
        VStack(spacing: 14) {
            Image(.homeBannerSet1)
            Image(.homeBannerSet2)
            Image(.homeBannerSet3)
        }
    }
    
    private var homeBottomBannerset: some View {
        VStack(spacing: 14) {
            Image(.homeBottomBannerSet)
            Image(.homeBottomBannerSet2)
            Image(.homeBottomBannerSet3)
        }
    }
}

#Preview {
    HomeView()
}

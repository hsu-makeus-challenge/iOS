//
//  HomeView.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import SwiftUI

struct HomeView: View {
    /// 관찰 가능한 객체를 HomeView에서 직접 생성후 소유한다.
    /// AppStorage에 저장된 닉네임과 더미데이터 랜더링
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            ScrollView(.vertical, content: {
                LazyVStack(spacing: 20) {
                    HomeBannerView()
                    
                    HomeMenuView()
                    
                    Image(.eventBanner)
                    
                    Image(.serviceSuscibe)
                    
                    Spacer()
                } //: LazyVStack
            })
        }
        .safeAreaPadding(.horizontal, 10)
        .ignoresSafeArea()
    }
}


#Preview {
    HomeView()
}

//
//  HomeView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                TopBannerView()
            }
        }
        .ignoresSafeArea()
    }
    
    
}

fileprivate struct TopBannerView: View {
    fileprivate var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(.homeTop)
                .resizable()
            
            Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                .font(.mainTextBold24)
                .foregroundStyle(Color(.black03))
                .padding(.bottom, 29)
                .padding(.leading, 28.16)
            
            HStack(spacing: 4) {
                Spacer()
                Text("내용 보기")
                Image(.goLine)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
            .padding(.trailing, 7)
        }
        .frame(height: 226)
        
        rewardBar
    }
    
    private var rewardBar: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("11★ until next Reward")
                    .font(.mainTextSemiBold16)
                    .foregroundStyle(Color(.brown02))
                
                ProgressView(value: 3, total: 12)
                    .progressViewStyle(
                        LinearProgressViewStyle(tint: Color(.brown01))
                    )
            }
            .frame(width: 255.79, height: 8)
            
            Spacer().frame(width: 36.37)
            
            Group {
                Text("1")
                    .font(.mainTextSemiBold34)
                    .foregroundStyle(Color(.black03))
                + Text("/")
                    .font(.mainTextSemiBold24)
                    .foregroundStyle(Color(.gray))
                + Text("12★")
                    .font(.mainTextSemiBold24)
                    .foregroundStyle(Color(.brown02))
            }
            .padding(.trailing, 7)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    HomeView()
}

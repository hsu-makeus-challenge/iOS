//
//  HomeView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("nickname") var storedNickname: String = "(작성한 닉네임)"
    var viewModel: HomeViewModel = .init()
    
    var body: some View {
        VStack {
            topBanner
            ScrollView {
                VStack(spacing: 20) {
                    Image("advertiseBanner")
                    RecommendedView
                    Image("eventBanner")
                    Image("serviceSuscibe")
                    NewsView
                }
                .padding(.horizontal, 10)
            }
        }.ignoresSafeArea(.all)
    }
    
    private var topBanner: some View {
        ZStack{
            Image("top_img")
            VStack(alignment: .leading, spacing: 11) {
                
                Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                    .font(.mainTextBold24)
                    .foregroundStyle(.black03)
                
                HStack(spacing: 38) {
                    VStack(alignment: .leading) {
                        Spacer().frame(height: 20)
                        Text("11⭑ until next Reward")
                            .font(.mainTextSemiBold16)
                            .foregroundStyle(.brown02)
                        
                        ProgressBar
                    }
                    
                    VStack(spacing: 5) {
                        HStack {
                            Text("내용 보기")
                                .font(.mainTextRegular13)
                                .foregroundStyle(.gray06)
                            Image("go_line")
                        }
                        HStack {
                            Text("1")
                                .font(.mainTextSemiBold38)
                                .foregroundStyle(.black03)
                            Text("/")
                                .font(.mainTextLight24)
                                .foregroundStyle(.gray00)
                            Text("12⭑")
                                .font(.mainTextSemiBold24)
                                .foregroundStyle(.brown02)
                        }
                    }
                }
            }
            .padding(.top, 120)
        }
    }
    
    private var ProgressBar: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 256, height: 8)
                .foregroundStyle(.gray)
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 111.5, height: 8)
                .foregroundStyle(.brown02)
            
        }
    }
    
    private var RecommendedView: some View {
        VStack(alignment: .leading, spacing: 25) {
            /// 텍스트
            Text(storedNickname)
                .font(.mainTextBold24)
                .foregroundStyle(.brown01)
            + Text("님을 위한 추천 메뉴")
                .font(.mainTextBold24)
                .foregroundStyle(.black03)
            
            /// 추천 메뉴 스크롤
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16, content: {
                    ForEach(viewModel.recommendedMenus, id: \.id, content: { menu in
                        CircleImageCard(name: menu.name, image: menu.imagename)
                    })
                })
            }
        }
        .padding(.horizontal, 10)
    }
    
    private var NewsView: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("What's New")
                .font(.mainTextBold24)
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(viewModel.newsLists, id: \.id, content: { news in
                        NewsCard(title: news.title, content: news.content, thumbnail: news.thumbnail)
                    })
                }
            }
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    HomeView()
}

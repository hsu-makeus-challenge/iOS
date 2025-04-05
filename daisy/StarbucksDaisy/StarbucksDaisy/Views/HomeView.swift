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
    var coffeeViewModel: CoffeeDetailViewModel = .init()
    @Bindable var router: NavigationRouter // 라우터 인스턴스 생성
    @State private var navigationTrue: Bool = false
    var coffeeList = CoffeeDetailViewModel().coffees
    
    var body: some View {
//        NavigationStack(path: $router.path) { //탭바에서 이미 스택 해줬으니까 또 네비게이션 스택 쓸 필요 없음
            VStack {
//                topBanner
                ScrollView {
                    VStack(spacing: 20) {
                        topBanner
                        Image("advertiseBanner")
                        RecommendedView
                        Image("eventBanner")
                        Image("serviceSuscibe")
                        NewsView
                        BannersView
                        DessertView
                        LastBannerView
                    }
                    .padding(.horizontal, 10)
                }
            }
            .ignoresSafeArea(.all)
//        }
    }
    
    /// 상단 토끼 배너
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
    
    /// 별 개수 progressbar
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
    
    /// 추천메뉴
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
                        Button(action: {
                            print(menu.name)
                            navigationTrue.toggle()
//                            router.push(.coffeDetail)
                        }, label: {
                            CircleImageCard(name: menu.name, image: menu.imagename)
                        })
                    })
                })
            }
        }
        .padding(.horizontal, 10)
        .navigationDestination(for: Route.self) { route in
            switch route {
            case .emailLogin:
                SignupView(router: router)
            case .coffeDetail:
                CoffeeDetailView()
            }
        }
//        .navigationDestination(isPresented: $navigationTrue, destination: {CoffeeDetailView(name: coffeeList.first., englishName: <#String#>, image: <#String#>, content: <#String#>, price: <#Double#>, isTwoType: <#Bool#>, isIce: <#Bool#>, isHot: <#Bool#>)})
    }
    
    /// What's New
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
    
    /// 중간 배너
    private var BannersView: some View {
        VStack(spacing: 14) {
            Image("mugcupBanner")
            ZStack{
                Image("starBanner")
                VStack(alignment: .leading) {
                    Text("TIP")
                        .font(.mainTextSemiBold12)
                        .foregroundStyle(.gray01)
                    
                    Spacer().frame(height: 4)
                    
                    Text("온라인 스토어\n별⭑ 적립 혜택")
                        .font(.mainTextBold24)
                        .foregroundStyle(.black03)
                    
                    Spacer().frame(height: 16)
                    
                    Text("온라인 스토어 구매 시\n별⭑을 적립해 드립니다.")
                        .font(.mainTextBold16)
                        .foregroundStyle(.gray01)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            }
            ZStack{
                Image("deliveryBanner")
                VStack(alignment: .leading, spacing: 16) {
                    Text("딜리버스\n예약 배달 서비스")
                        .font(.mainTextBold22)
                        .foregroundStyle(.green03)
                    
                    Text("특별한 순간을 위해\n미리 예약해 보세요.")
                        .font(.mainTextBold16)
                        .foregroundStyle(.black02)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 24)
            }
        }
    }
    
    /// 디저트 메뉴 추천
    private var DessertView: some View {
        VStack(alignment: .leading, spacing: 25) {
            /// 텍스트
            Text("하루가 달콤해지는 디저트")
                .font(.mainTextSemiBold24)
                .foregroundStyle(.black03)
            
            /// 디저트 스크롤
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16, content: {
                    ForEach(viewModel.dessertsLists, id: \.id, content: { menu in
                        Button(action: {
                            
                        }, label: {
                            CircleImageCard(name: menu.name, image: menu.image)
                        })
                    })
                })
            }
        }
        .padding(.horizontal, 10)
    }
    
    /// 하단 배너
    private var LastBannerView: some View {
        VStack(spacing: 10) {
            Image("coldbrewBanner")
            Image("baristaBanner")
            Image("sizeupBanner")
        }
    }

}

#Preview {
    HomeView(router: NavigationRouter())
}

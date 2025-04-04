//
//  HomeView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import SwiftUI

struct HomeView: View {
    @Bindable private var homeViewModel: HomeViewModel
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                TopBannerView()
                
                Spacer().frame(height: 23)
                
                SecondHomeBannerView()
                
                Spacer().frame(height: 20)
                
                RecommendedDrinksView(homeViewModel: homeViewModel)
                
                Spacer().frame(height: 20)
                
                BloomingChouxPricingBanner()
                
                Spacer().frame(height: 20)
                
                ServiceSubscribeBannerView()
                
                Spacer().frame(height: 20)
                
                WhatsNewsView(homeViewModel: homeViewModel)
                
                Spacer().frame(height: 20)
                
                MugCupAndOnlineStoreAndDeliveryBannerView()
                
                Spacer().frame(height: 20)
                
                DessertView(homeViewModel: homeViewModel)
                
                Spacer().frame(height: 20)
                
                PromotionalCardGroupView()
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

fileprivate struct SecondHomeBannerView: View {
    fileprivate var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(.homeBanner)
                .resizable()
            
            VStack(alignment: .leading, spacing: 16) {
                Group {
                    Text("아이스 챌린지 카페 아메리카노\n")
                        .foregroundStyle(Color(.brown01))
                    + Text("주문하고,\n")
                        .foregroundStyle(.white)
                    + Text("사이즈 업 ")
                        .foregroundStyle(Color(.brown01))
                    + Text("받으세요!")
                        .foregroundStyle(.white)
                }
                .font(.mainTextSemiBold24)
                .kerning(-0.5)
                
                Text("22023. 1. 26 ~ 1. 30")
                    .font(.mainTextMedium16)
                    .foregroundStyle(.white)
            }
            .padding(.leading, 24)
            .padding(.bottom, 29)
        }
        .frame(width: 420, height: 183)
    }
}

fileprivate struct RecommendedDrinksView: View {
    @AppStorage("nickname") private var nickname: String?
    @Bindable private var homeViewModel: HomeViewModel
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    fileprivate var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            Group {
                if let nickname {
                    Text("\(nickname)")
                        .foregroundStyle(Color(.brown01))
                    + Text("님을 위한 메뉴 추천")
                        .foregroundStyle(.black)
                } else {
                    Text("(작성한 닉네임)")
                        .foregroundStyle(Color(.brown01))
                    + Text("님을 위한 메뉴 추천")
                        .foregroundStyle(.black)
                }
                
                recommendedDrinkGroup
            }
            .font(.mainTextBold24)
            .padding(.leading, 20)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var recommendedDrinkGroup: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: [GridItem(.fixed(130))],
                spacing: 16 // LazyHGrid이기 때문에 좌우 간격임
            ) {
                ForEach(
                    homeViewModel.recommendedDrinks,
                    id: \.id
                ) { drinkModel in
                    makeDrinkCard(drinkModel)
                }
            }
        }
    }
    
    private func makeDrinkCard(_ model: RecommendedDrink) -> some View {
        Button {
            homeViewModel.moveToMenuDetails(
                menuID: model.menuID,
                temperatureType: model.temperatureType
            )
        } label: {
            VStack(spacing: 10) {
                Image(model.image)
                    .resizable()
                    .frame(width: 130, height: 130)
                
                Text(model.name)
                    .font(.mainTextLight14)
                    .foregroundStyle(.black)
            }
        }

    }
}

fileprivate struct BloomingChouxPricingBanner: View {
    fileprivate var body: some View {
        Image(.homeEventBanner)
            .resizable()
            .frame(width: 420, height: 451)
            .scaledToFit()
    }
}

fileprivate struct ServiceSubscribeBannerView: View {
    fileprivate var body: some View {
        Image(.serviceSuscibe)
            .resizable()
            .frame(width: 420, height: 199)
            .scaledToFit()
    }
}

fileprivate struct WhatsNewsView: View {
    @Bindable private var homeViewModel: HomeViewModel
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    fileprivate var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("What's News")
                .font(.mainTextBold24)
                .foregroundStyle(Color(.black03))
            
            newsCardGroup
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 10)
    }
    
    private var newsCardGroup: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: [GridItem(.fixed(240))],
                spacing: 16
            ) {
                ForEach(homeViewModel.newsCards, id: \.id) { newsCard in
                    makeNewsCard(newsCard)
                }
            }
        }
    }
    
    private func makeNewsCard(_ model: NewsCard) -> some View {
        VStack {
            Image(model.image)
                .resizable()
                .frame(width: 242, height: 160)
                .scaledToFit()
            
            Spacer().frame(height: 16)
            
            Text(model.title)
                .font(.mainTextRegular18)
                .foregroundStyle(Color(.black02))
            
            Spacer().frame(height: 9)
            
            Text(model.subTitle)
                .font(.mainTextRegular13)
                .foregroundStyle(Color(.gray03))
        }
        .frame(width: 240, height: 249)
    }
}

fileprivate struct MugCupAndOnlineStoreAndDeliveryBannerView: View {
    fileprivate var body: some View {
        VStack(spacing: 14) {
            Image(.mugcupBanner)
                .resizable()
                .frame(width: 420, height: 217.78)
                .scaledToFit()
            
            Image(.onlineStoreBanner)
                .resizable()
                .frame(width: 420, height: 272.82)
                .scaledToFit()
            
            Image(.deliveryBanner)
                .resizable()
                .frame(width: 420, height: 217.78)
                .scaledToFit()
        }
    }
}

fileprivate struct DessertView: View {
    @Bindable private var homeViewModel: HomeViewModel
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    fileprivate var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("하루가 달콤해지는 디저트")
                .font(.mainTextBold24)
                .foregroundStyle(Color(.black03))
            
            dessertGroup
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 10)
    }
    
    private var dessertGroup: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: [GridItem(.fixed(130))],
                spacing: 16 // LazyHGrid이기 때문에 좌우 간격임
            ) {
                ForEach(
                    homeViewModel.desserts,
                    id: \.id
                ) { dessertModel in
                    makeDessertCard(dessertModel)
                }
            }
        }
    }
    
    private func makeDessertCard(_ model: Dessert) -> some View {
        VStack(spacing: 10) {
            Image(model.image)
                .resizable()
                .frame(width: 130, height: 130)
            
            Text(model.name)
                .font(.mainTextLight14)
                .foregroundStyle(.black)
        }
    }
}

fileprivate struct PromotionalCardGroupView: View {
    fileprivate var body: some View {
        VStack(spacing: 20) {
            Image(.coldBrewBanner)
                .resizable()
                .frame(width: 420, height: 182)
                .scaledToFit()
            
            Image(.representativeBeverage)
                .resizable()
                .frame(width: 420, height: 360)
                .scaledToFit()
            
            Image(.manufactureBanner)
                .resizable()
                .frame(width: 420, height: 182)
                .scaledToFit()
        }
    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews : some View {
        let previewEnv = AppEnvironment.previewEnv
        ForEach(
            PREVIEW_DEVICE_TYPE.allCases,
            id: \.self
        ) { deviceType in
            HomeView(homeViewModel: previewEnv.makeHomeVieModel())
                .environmentObject(previewEnv)
                .previewDevice(
                    PreviewDevice(rawValue: deviceType.rawValue))
                .previewDisplayName(deviceType.rawValue)
            
        }
    }
}

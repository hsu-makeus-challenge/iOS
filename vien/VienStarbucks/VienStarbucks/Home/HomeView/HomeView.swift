import SwiftUI

struct HomeView: View {
    @State private var selectedCoffeeName: String? = nil
    @State private var showAdPopup: Bool = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack {
                        HomeBannerView()
                        BarView()
                        Spacer().frame(height:26)
                        BearBannerView()
                        Spacer().frame(height:20)
                        CoffeeRecommendView(onCoffeeSelected: { name in
                            selectedCoffeeName = name
                        })
                        Spacer().frame(height:20)
                        twoBannerView()
                        Spacer().frame(height:20)
                        WhatsNewView()
                        Spacer().frame(height:20)
                        threeBannerView()
                        Spacer().frame(height:20)
                        DesertBreadView()
                        Spacer().frame(height:20)
                        bottomBannerView()
                    }
                }
                .ignoresSafeArea()

                // AdPopupView를 오버레이로 띄움
                if showAdPopup {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .transition(.opacity)

                    AdPopupView(isShowing: $showAdPopup)
                        .transition(.scale)
                        .zIndex(1)
                }
            }
            .navigationDestination(isPresented: Binding<Bool>(
                get: { selectedCoffeeName != nil },
                set: { if !$0 { selectedCoffeeName = nil } }
            )) {
                if let name = selectedCoffeeName {
                    CoffeeDetailView(coffeeName: name)
                }
            }
        }
    }
}


struct HomeBannerView: View {
    var body: some View {
        ZStack {
            Image("top_img")
//                .resizable()
//                .frame(width: 440, height: 259)
                .resizable()
                .frame(height: 259)
                .ignoresSafeArea()
            
            
            VStack(alignment: .leading) {
                Spacer().frame(height: 120)
                
                Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                    .font(.mainTextBold24)
                    .foregroundColor(.black)
                    .padding(.leading, 29)
                
                
                Spacer().frame(height: 9)
                
                HStack{
                    Spacer()
                    
                    Text("내용 보기")
                        .font(.mainTextRegular13)
                        .foregroundColor(.gray06)
                    
                    Image("goLine")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 5)
                }
                .padding(.trailing, 13)
                
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        
    }
}

struct BarView: View {
    var currentStar = 1
    var totalStar = 12

    var body: some View {
        VStack {
            HStack {
                Text("11★ until next Reward")
                    .foregroundColor(.brown02)

                Spacer()

                Text("\(currentStar) / \(totalStar)★")
                    .foregroundColor(.brown02)
            }
            .font(.subheadline)

            GaugeBarView(current: currentStar, total: totalStar)
                .frame(height: 8)
                .foregroundColor(.brown01)
        }
        .padding(.horizontal, 29)
        
        
    }
}

struct GaugeBarView: View {
    var current: Int
    var total: Int

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                Capsule()
                    .fill(Color.orange)
                    .frame(width: geometry.size.width * CGFloat(current) / CGFloat(total))
            }
        }
    }
}


struct BearBannerView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("bear_banner")
                .resizable()
                .frame(width:420, height: 183)
                .padding(.horizontal, 10)
            
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
             
                            
                Text("22023. 1. 26 ~ 1. 30")
                    .font(.mainTextMedium16)
                    .foregroundStyle(.white)
            }
            .padding(.leading, 24)
            .padding(.bottom, 29)
        }
    }
}


struct twoBannerView: View{
    var body: some View {
        VStack{
            Image("eventBanner")
                .resizable()
                .scaledToFit()
                .frame(width: 420, height: 451)
            
            Spacer().frame(height: 20)
            
            Image("serviceSuscribe")
                .resizable()
                .frame(width: 420, height: 199)
        }
        .padding(.horizontal, 10)
    }
}


struct threeBannerView: View{
    var body: some View {
        VStack{
            Image("MugBanner")
                .resizable()
                .frame(width:420, height: 218)
            
            Spacer().frame(height: 14)
            
            Image("OnlineStoreStarBanner")
                .resizable()
                .frame(width:420, height: 273)
            
            Spacer().frame(height: 14)
            
            Image("DeliveryServiceBanner")
                .resizable()
                .frame(width:420, height: 218)
            
        }
    }
}


struct bottomBannerView: View{
    var body: some View {
        Image("ColdBrewBanner")
            .resizable()
            .frame(width:420, height: 182)
        
        Spacer().frame(height:20)
        
        Image("BaristaFavoritesBanner")
            .resizable()
            .frame(width:420, height: 360)
        
        Spacer().frame(height:20)
        
        Image("SmileClubBanner")
            .resizable()
            .frame(width:420, height: 182)
    }
}


#Preview {
    HomeView()
}

//
//  OtherView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/27/25.
//

import SwiftUI

struct OtherView: View {
    
    var body: some View {
        VStack(spacing: 41) {
            OtherHeaderView()
            
            OtherWelcomeView()
            
            OtherPaySectionView()
            
            OtherCustomerSupportSectionView()
            
            Spacer()
        }
        .background(Color(.white01))
    }
}

struct OtherHeaderView: View {
    var body: some View {
        HStack {
            Text("Other")
                .font(.mainTextBold24)
                .foregroundStyle(.black)
            
            Spacer()
            
            Button {
                print("Logout")
            } label: {
                Image(.logoutIcon)
                    .resizable()
                    .frame(width: 35, height: 35)
            }

        }
        .padding(.horizontal, 23.5)
        .frame(height: 80)
        .background(Color.white)
    }
}

struct OtherWelcomeView: View {
    
    @AppStorage("nickname") private var nickname: String?
    
    var body: some View {
        VStack {
            Group {
                if let nickname {
                    Text("\(nickname)")
                        .foregroundStyle(Color(.green01))
                    + Text("님")
                        .foregroundStyle(.black)
                } else {
                    Text("(작성한 닉네임)")
                        .foregroundStyle(Color(.green01))
                    + Text("님")
                        .foregroundStyle(.black)
                }
                
                Text("환영합니다🙌")
                    .foregroundStyle(.black)
            }
            .font(.mainTextBold24)
            
            Spacer().frame(height: 24)
            
            HStack(spacing: 10.5) {
                ShortcutButtonView(
                    image: .starHistoryIcon,
                    imageLabel: "별 히스토리"
                )
                
                ShortcutButtonView(
                    image: .receiptIcon,
                    imageLabel: "전자영수증"
                )
                
                ShortcutButtonView(
                    image: .myMenuIcon,
                    imageLabel: "나만의 메뉴"
                )
            }
        }
    }
}

struct OtherPaySectionView: View {
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let items: [(icon: ImageResource, title: String)] = [
        (.Pay.payCard, "스타벅스 카드 등록"),
        (.Pay.payCouponExchange, "카드 교환권 등록"),
        (.Pay.payCouponAdd, "쿠폰 등록"),
        (.Pay.payCouponHistory, "쿠폰 히스토리")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Pay")
                .font(.mainTextSemiBold18)
                .foregroundStyle(.black)
            
            LazyVGrid(
                columns: columns,
                alignment: .leading,
                spacing: 16
            ) {
                ForEach(items, id: \.title) { item in
                    OtherSectionGridItem(
                        icon: item.icon,
                        title: item.title
                    )
                }
            }
            .padding(.vertical, 16)
        }
        .frame(width: 420, height: 164)
    }
}

struct OtherCustomerSupportSectionView: View {
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let items: [(icon: ImageResource, title: String)] = [
        (.CustomerSupport.storeCare, "스토어 케어"),
        (.CustomerSupport.customerSound, "고객의 소리"),
        (.CustomerSupport.storeInfo, "매장 정보"),
        (.CustomerSupport.returnInfo, "반납기 정보"),
        (.CustomerSupport.myReview, "마이 스타벅스 리뷰")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("고객지원")
                .font(.mainTextSemiBold18)
                .foregroundStyle(.black)
            
            LazyVGrid(
                columns: columns,
                alignment: .leading,
                spacing: 16
            ) {
                ForEach(items, id: \.title) { item in
                    OtherSectionGridItem(
                        icon: item.icon,
                        title: item.title
                    )
                }
            }
            .padding(.vertical, 16)
        }
        .frame(width: 420, height: 164)
    }
}

// MARK: - 각 섹션별 메뉴 버튼

struct OtherSectionGridItem: View {
    
    private var icon: ImageResource
    private var title: String
    
    init(
        icon: ImageResource,
        title: String
    ) {
        self.icon = icon
        self.title = title
    }
    
    var body: some View {
        Button {
            print("\(title)")
        } label: {
            HStack {
                Image(icon)
                    .resizable()
                    .frame(width: 32, height: 32)
                
                Text("\(title)")
                    .font(.mainTextSemiBold16)
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    OtherView()
}

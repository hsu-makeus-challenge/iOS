//
//  OtherView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/27/25.
//

import SwiftUI

struct OtherGridItem: Identifiable {
    let id = UUID()
    let icon: ImageResource
    let title: String
}

struct OtherView: View {
    
    private let payGtidItems: [OtherGridItem] = [
        .init(icon: .Pay.payCard, title: "스타벅스 카드 등록"),
        .init(
            icon: .Pay.payCouponExchange,
            title: "카드 교환권 등록"
        ),
        .init(
            icon: .Pay.payCouponAdd,
            title: "쿠폰 등록"
        ),
        .init(
            icon: .Pay.payCouponHistory,
            title: "쿠폰 히스토리"
        ),
    ]
    
    private let customerSupportItems: [OtherGridItem] = [
        .init(icon: .CustomerSupport.storeCare, title: "스토어 케어"),
        .init(icon: .CustomerSupport.customerSound, title: "고객의 소리"),
        .init(icon: .CustomerSupport.storeInfo, title: "매장 정보"),
        .init(icon: .CustomerSupport.returnInfo, title: "반납기 정보"),
        .init(icon: .CustomerSupport.myReview, title: "마이 스타벅스 리뷰")
    ]
    
    var body: some View {
        VStack(spacing: 41) {
            OtherHeaderView()
            
            OtherWelcomeView()
            
            OtherSectionView(items: payGtidItems)
            
            OtherSectionView(items: customerSupportItems)
            
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

struct OtherSectionView: View {
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let items: [OtherGridItem]
    
    init(items: [OtherGridItem]) {
        self.items = items
    }
    
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

struct OtherSectionView_Preview: PreviewProvider {
    static var previews : some View {
        ForEach(
            PREVIEW_DEVICE_TYPE.allCases,
            id: \.self
        ) { deviceType in
            OtherView()
                .previewDevice(
                    PreviewDevice(rawValue: deviceType.rawValue))
                .previewDisplayName(deviceType.rawValue)
            
        }
    }
}

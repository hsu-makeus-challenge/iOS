//
//  CustomCarousel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 6/18/25.
//

import SwiftUI
import SwiftData

@Model
class PayCard: Identifiable {
    @Attribute(.unique) var id: UUID
    var image: String
    var cardName: String
    var balance: Int
    var cardNumber: String
    var createdAt: Date

    init(
        image: String,
        cardName: String,
        balance: Int,
        cardNumber: String
    ) {
        self.id = UUID()
        self.image = image
        self.cardName = cardName
        self.balance = balance
        self.cardNumber = cardNumber
        self.createdAt = Date()
    }

}

/// Custom View
struct CustomCarousel<Content: View, Data: RandomAccessCollection>: View where Data.Element: Identifiable {
    var config: Config
    @Binding var selection: Data.Element.ID?
    var data: Data
    @ViewBuilder var content: (Data.Element) -> Content
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            ScrollView(.horizontal) {
                HStack(spacing: config.spacing) {
                    ForEach(data) { item in
                        ItemView(item)
                    }
                }
                .scrollTargetLayout()
            }
            .safeAreaPadding(.horizontal, (size.width - config.cardWidth) / 2)
            .scrollPosition(id: $selection)
            .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
            .scrollIndicators(.hidden)
        }
    }
    
    @ViewBuilder
    func ItemView(_ item: Data.Element) -> some View {
        GeometryReader { proxy in
            /// 현재 GeometryReader가 감싸고 있는 카드 뷰의 크기를 가져온다.
            let size = proxy.size
            
            /// 스크롤뷰 내부에서의 현재 카드의 좌측 위치(x좌표)를 의미
            /// 기준점은 .scrollView(axis: .horiznotal))로 하여, 수평 스크롤에서의 상대적 위치를 측정
            let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
            
            /// 현재 카드가 기준점(보통 중앙)에서 얼마나 이동했는지를 비율로 나타낸다.
            /// 중앙: 0, 오른쪽: 양수, 왼쪽: 음수
            /// 카드 하나만큼 이동했을 progress는 ±1이다.
            let progress = minX / (config.cardWidth + config.spacing)
            /// 캐러셀에서 카드가 작아질 수 있는 최소 너비
            let minimunCardWidth = config.minimunCardWidth
            
            /// 전체 카드 너비와 최소 너비의 차이, 즉 최대로 축소될 수 있는 너비 폭
            let diffWidth = config.cardWidth - minimunCardWidth
            
            /// progress에 따라 얼마나 줄어들어야 하는지를 계산
            /// 이 값을 이용하면 카드가 중앙에서 멀어질수록 점점 작아지도록 만들 수 있음
//            let reducingWidth = progress * diffWidth
            
            /// progress의 절대값을 통해 중앙에서 얼마나 떨어졌는지를 기반으로 scale값 계산
            let scaleValue = config.scaleValue * abs(progress)
            let opacityValue = config.opacityValue * abs(progress)
            
            content(item)
                .frame(width: size.width, height: size.height)
                .opacity(config.hasOpacity ? 1 - opacityValue : 1)
                /// caleEffect 수정자는 SwiftUI에서 뷰의 크기를 비율로 확대하거나 축소할 때 사용하는 뷰 수정자
                /// 쉽게 말해, 뷰를 스케일(배율)만큼 커지거나 작게 보이도록 만들어준다.
                .scaleEffect(config.hasScale ? 1 - scaleValue : 1)
                .clipShape(.rect(cornerRadius: config.cornerRadius))
        }
        .frame(width: config.cardWidth)
    }
    
    /// Config
    struct Config {
        var hasOpacity: Bool = false
        var opacityValue: CGFloat = 0.5
        var hasScale: Bool = false
        var scaleValue: CGFloat = 0.2
        
        var cardWidth: CGFloat = 272
        var spacing: CGFloat = 10
        var cornerRadius: CGFloat = 15
        var minimunCardWidth: CGFloat = 40
    }
}

#Preview {
    PayView()
}

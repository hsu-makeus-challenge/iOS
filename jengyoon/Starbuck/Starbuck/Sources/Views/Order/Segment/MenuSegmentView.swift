//
//  MenuSegmentView.swift
//  Starbuck
//
//  Created by 송승윤 on 5/4/25.
//

import SwiftUI

/// OrderView 메뉴 세그먼트 뷰
enum MenuSegment: Int, CaseIterable {
    case drink, food, product
    
    var title: String {
        switch self {
        case .drink: return "음료"
        case .food: return "푸드"
        case .product: return "상품"
        }
    }
}

struct MenuSegmentView: View {
    @Binding var menuSegment: MenuSegment
    var body: some View {
        HStack {
            ForEach(MenuSegment.allCases, id: \.self) { segment in
                Button(action: {
                    menuSegment = segment
                }) {
                    Text(segment.title)
                        .font(.PretendardSemiBold16)
                        .foregroundStyle(menuSegment == segment ? Color.black01 : Color.gray)
                        .frame(width: 50)
                        .padding(.vertical, 12)
                }
            }
        }
        .background(Color.white)
    }
}

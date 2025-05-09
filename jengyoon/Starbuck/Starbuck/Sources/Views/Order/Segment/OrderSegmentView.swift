//
//  OrderSegmentView.swift
//  Starbuck
//
//  Created by 송승윤 on 5/4/25.
//

import SwiftUI

// MARK: - Enum
enum OrderSegment: Int, CaseIterable {
    case allMenu, myMenu, cakeReservation

    var title: String {
        switch self {
        case .allMenu: return "전체 메뉴"
        case .myMenu: return "나만의 메뉴"
        case .cakeReservation: return "홀케이크 예약"
        }
    }
}

// MARK: - Capsule 이동 뷰
struct SegmentCapsuleView: View {
    var selectedSegment: OrderSegment

    var body: some View {
        GeometryReader { geometry in
            Capsule()
                .fill(Color.green)
                .frame(
                    width: geometry.size.width / CGFloat(OrderSegment.allCases.count),
                    height: 3
                )
                .offset(
                    x: geometry.size.width / CGFloat(OrderSegment.allCases.count)
                    * CGFloat(selectedSegment.rawValue)
                )
        }
        .frame(height: 3)
    }
}

// MARK: - 상단 세그먼트 뷰
struct OrderSegmentView: View {
    @Binding var selectedSegment: OrderSegment

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(OrderSegment.allCases, id: \.self) { segment in
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedSegment = segment
                        }
                    }) {
                        Text(segment.title)
                            .font(.PretendardMedium16)
                            .foregroundStyle(
                                selectedSegment == segment ? Color.black : Color.gray
                            )
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                    }
                }
            }
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)

            SegmentCapsuleView(selectedSegment: selectedSegment)
        }
    }
}

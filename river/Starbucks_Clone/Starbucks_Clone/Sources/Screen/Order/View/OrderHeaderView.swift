//
//  OrderHeaderView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/1/25.
//

import SwiftUI

struct OrderHeaderView: View {
    @Bindable private var tabState: OrderTabState
    
    init(tabState: OrderTabState) {
        self.tabState = tabState
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            orderTextView
            
            HStack {
                MenuSegmentedView(tabState: tabState)
                
                cakeReservationBtn
            }
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(.gray02).opacity(0.4)),
                alignment: .bottom
            )
            .shadow(color: Color(.black01).opacity(0.15), radius: 0, y: 1)
        }
        .frame(maxWidth: .infinity)
    }
    
    private var orderTextView: some View {
        HStack {
            Text("Order")
                .font(.mainTextBold24)
                .foregroundStyle(Color(.black03))
            Spacer()
        }
        .padding(.horizontal, 23)
    }
    
    private var cakeReservationBtn: some View {
        Button {
            print("홀케이크 예약")
        } label: {
            HStack(spacing: 4) {
                Image(.Order.cakeIcon)
                
                Text("홀케이크 예약")
                    .foregroundStyle(Color(.green01))
                    .font(.pretend(type: .bold, size: 16))
            }
        }
        .frame(width: 201)
    }
}

fileprivate struct MenuSegmentedView: View {
    
    @Namespace private var underlineSegmentedBar
    @Bindable private var tabState: OrderTabState
    
    init(tabState: OrderTabState) {
        self.tabState = tabState
    }
    
    fileprivate var body: some View {
        ForEach(OrderSegmentType.allCases) { segment in
            Button {
                withAnimation {
                    tabState.selectedSegment = segment
                }
            } label: {
                VStack(spacing: 4) {
                    Text(segment.title)
                        .font(.pretend(type: .bold, size: 16))
                        .foregroundColor(
                            tabState.selectedSegment == segment
                            ? Color(.black01)
                            : Color(.gray04)
                        )
                        .padding(.vertical, 13)
                    
                    if tabState.selectedSegment == segment {
                        Color.green
                            .frame(height: 3)
                            /// 두 개의 뷰 간 애니메이션 자연스럽게 연결하는 수정자
                            /// - id: 두 뷰가 같은 것처럼 연동하는 식별자
                            /// - namespace: 그룹화
                            .matchedGeometryEffect(
                                id: "underline",
                                in: underlineSegmentedBar
                            )
                    } else {
                        Color.clear.frame(height: 3)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    OrderHeaderView(tabState: .init())
}

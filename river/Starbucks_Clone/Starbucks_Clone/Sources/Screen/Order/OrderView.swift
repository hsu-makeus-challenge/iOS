//
//  OrderView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/1/25.
//

import SwiftUI

struct OrderView: View {
    
    @State private var selectedSegmentType: OrderSegmentType = .allMenu
    @State private var selectedCategoryType: OrderCategoryType = .beverage
    
    var body: some View {
        VStack(alignment: .leading) {
            OrderHeaderView(selectedSegmentType: $selectedSegmentType)
            
            OrderContentView(selectedCategoryType: $selectedCategoryType)
        }
    }
}

fileprivate struct OrderHeaderView: View {
    
    @Namespace private var underlineSegmentedBar
    @Binding private var selectedSegmentType: OrderSegmentType
    
    init(selectedSegmentType: Binding<OrderSegmentType>) {
        self._selectedSegmentType = selectedSegmentType
    }
    
    fileprivate var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            orderTextView
            
            HStack {
                menuSegementedBar
                
                cakeReservationBtn
            }
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
    
    private var menuSegementedBar: some View {
        ForEach(OrderSegmentType.allCases) { segemnt in
            Button {
                withAnimation(.easeInOut(duration: 0.3)) {
                    selectedSegmentType = segemnt
                }
            } label: {
                VStack(spacing: 4) {
                    Text(segemnt.rawValue)
                        .font(.pretend(type: .bold, size: 16))
                        .foregroundColor(
                            selectedSegmentType == segemnt
                            ? Color(.black01)
                            : Color(.gray04)
                        )
                        .padding(.vertical, 13)
                    
                    if selectedSegmentType == segemnt {
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

fileprivate struct OrderContentView: View {
    
    @Binding private var selectedCategoryType: OrderCategoryType
    
    init(selectedCategoryType: Binding<OrderCategoryType>) {
        self._selectedCategoryType = selectedCategoryType
    }
    
    fileprivate var body: some View {
        VStack {
            OrderCategorySegementView(
                selectedCategoryType: $selectedCategoryType
            )
        }
    }
}

fileprivate struct OrderCategorySegementView: View {
    
    @Binding private var selectedCategoryType: OrderCategoryType
    
    init(selectedCategoryType: Binding<OrderCategoryType>) {
        self._selectedCategoryType = selectedCategoryType
    }
    
    fileprivate var body: some View {
        HStack {
            Spacer().frame(width: 23)
            
            ForEach(OrderCategoryType.allCases) { category in
                Button {
                    selectedCategoryType = category
                } label: {
                    Text(category.rawValue)
                        .font(.mainTextSemiBold16)
                        .foregroundStyle(
                            selectedCategoryType == category
                            ? Color(.black01)
                            : Color(.gray04)
                        )
                    
                    if category.isNew {
                        Text("New")
                            .foregroundColor(.green)
                            .font(.caption)
                            .italic()
                    }
                }
                .padding(.horizontal, 6)
                .padding(.vertical, 18)
            }
            
            Spacer()
        }
        .frame(height: 52)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(.gray02).opacity(0.25)),
            alignment: .bottom
        )
        .shadow(color: Color(.black01).opacity(0.15), radius: 0, y: 1)
    }
}

struct Order_Preview: PreviewProvider {
    static var previews: some View {
        devicePreviews {
            OrderView()
                .environmentObject(AppEnvironment.previewEnv)
        }
    }
}

//
//  OrderView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/1/25.
//

import SwiftUI

struct OrderView: View {
    
    @State private var selectedSegmentType: OrderSegmentType = .allMenu
    @State private var selectedCategoryType: MenuCategoryType = .beverage
    
    var body: some View {
        VStack(alignment: .leading) {
            OrderHeaderView(selectedSegmentType: $selectedSegmentType)
            
            MenuCategorySegementView(
                selectedCategoryType: $selectedCategoryType
            )
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
                withAnimation(.easeOut(duration: 0.3)) {
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
                        .padding(.horizontal, 23)
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
}

enum MenuCategoryType: String, CaseIterable, Identifiable {
    case beverage = "음료"
    case food = "푸드"
    case merchandise = "상품"

    var id: Self { self }

    var isNew: Bool {
        switch self {
        case .beverage, .food, .merchandise:
            return true // 현재는 모두 new, 이후 동적으로 관리 가능
        }
    }
}

fileprivate struct MenuCategorySegementView: View {
    
    @Binding private var selectedCategoryType: MenuCategoryType
    
    init(selectedCategoryType: Binding<MenuCategoryType>) {
        self._selectedCategoryType = selectedCategoryType
    }
    
    fileprivate var body: some View {
        HStack {
            Spacer().frame(width: 23)
            
            ForEach(MenuCategoryType.allCases) { category in
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
    }
}

#Preview {
    OrderView()
}

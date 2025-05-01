//
//  OrderView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/1/25.
//

import SwiftUI

@Observable
final class OrderTabState {
    var selectedSegment: OrderSegmentType = .allMenu
    var selectedCategory: OrderCategoryType = .beverage
}

struct OrderView: View {
    
    @State private var tabState = OrderTabState()
    
    var body: some View {
        VStack(alignment: .leading) {
            OrderHeaderView(tabState: tabState)
            
            OrderContentView(tabState: tabState)
        }
    }
}

fileprivate struct OrderHeaderView: View {
    
    @Namespace private var underlineSegmentedBar
    @Bindable private var tabState: OrderTabState
    
    init(tabState: OrderTabState) {
        self.tabState = tabState
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
                withAnimation {
                    tabState.selectedSegment = segemnt
                }
            } label: {
                VStack(spacing: 4) {
                    Text("나만의 메뉴")
                        .font(.pretend(type: .bold, size: 16))
                        .foregroundColor(
                            tabState.selectedSegment == segemnt
                            ? Color(.black01)
                            : Color(.gray04)
                        )
                        .padding(.vertical, 13)
                    
                    if tabState.selectedSegment == segemnt {
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
    
    @State private var orderViewModel: OrderViewModel = .init()
    @Bindable private var tabState: OrderTabState
    
    init(tabState: OrderTabState) {
        self.tabState = tabState
    }
    
    fileprivate var body: some View {
        TabView(selection: $tabState.selectedSegment) {
            VStack {
                OrderCategorySegementView(tabState: tabState)
                OrderMenuListView(orderViewModel: orderViewModel)
            }
            .tag(OrderSegmentType.allMenu)

            VStack {
                Text("나만의 메뉴 화면")
                Spacer()
            }
            .tag(OrderSegmentType.myMenu)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(
            .easeInOut,
            value: tabState.selectedSegment
        )
        
    }
}

fileprivate struct OrderCategorySegementView: View {
    
    @Bindable private var tabState: OrderTabState
    
    init(tabState: OrderTabState) {
        self.tabState = tabState
    }
    
    fileprivate var body: some View {
        HStack {
            Spacer().frame(width: 23)
            
            ForEach(OrderCategoryType.allCases) { category in
                Button {
                    tabState.selectedCategory = category
                } label: {
                    Text(category.rawValue)
                        .font(.mainTextSemiBold16)
                        .foregroundStyle(
                            tabState.selectedCategory == category
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

fileprivate struct OrderMenuListView: View {
    @Bindable private var orderViewModel: OrderViewModel
    
    init(orderViewModel: OrderViewModel) {
        self.orderViewModel = orderViewModel
    }
    
    fileprivate var body: some View {
        List {
            ForEach(
                orderViewModel.orderModel.catetories,
                id:\.id
            ) { category in
                HStack {
                    Image(category.imageName)
                    
                    VStack {
                        Text(category.title)
                        
                        Text(category.titleEn)
                    }
                }
            }
        }
        .listStyle(.plain)
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

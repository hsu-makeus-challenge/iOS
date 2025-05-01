//
//  OrderAllMenuView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/1/25.
//

import SwiftUI

struct OrderAllMenuView: View {
    
    @State private var orderViewModel: OrderViewModel = .init()
    @Bindable private var tabState: OrderTabState
    
    init(tabState: OrderTabState) {
        self.tabState = tabState
    }
    
    var body: some View {
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

#Preview {
    OrderAllMenuView(tabState: .init())
}

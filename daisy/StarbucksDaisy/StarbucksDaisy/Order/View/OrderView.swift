//
//  OrderView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct OrderView: View {
    
    @Bindable var viewModel: OrderViewModel = .init()
    @Namespace private var underlineSegmentNamespace
    
    var body: some View {
        VStack(spacing: 0) {
            SegmentsView
            Divider()
            tabview
        }
    }
    
    private var SegmentsView: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Order")
                .font(.mainTextBold24)
                .foregroundStyle(.black03)
                .padding(.horizontal, 23)
                .padding(.top, 19)
            
            HStack(spacing: 0) {
                ForEach(OrderSegment.allCases, id: \.id) { segment in
                    topSegment(segment: segment)
                }
            }
            .animation(.easeInOut, value: viewModel.selectedSegment)
            
            HStack {
                ForEach(MenuSegment.allCases, id: \.id) { segment in
                    BottomSegment(segment: segment)
                }
            }
            .frame(height: 52)
            .padding(.leading, 23)
        }
    }
    
    @ViewBuilder
    func topSegment(segment: OrderSegment) -> some View {
        VStack(spacing: 0) {
            Text(segment.title)
                .font(.mainTextBold16)
                .foregroundStyle(viewModel.selectedSegment == segment ? .black01 : .gray04)
                .padding(.horizontal, 23)
                .padding(.vertical, 13)
                .onTapGesture {
                    viewModel.selectedSegment = segment
                }
            if viewModel.selectedSegment == segment {
                Rectangle()
                    .fill(viewModel.selectedSegment == segment ? Color.green01 : .gray.opacity(0.2))
                    .frame(height: 3)
                    .shadow(color: .black.opacity(0.15), radius: 1.5, x: 0, y: 3)
                    .matchedGeometryEffect(id: "underlineSegment", in: underlineSegmentNamespace)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    func BottomSegment(segment: MenuSegment) -> some View {
        HStack(spacing: 2) {
            Text(segment.title)
                .font(.mainTextSemiBold16)
                .foregroundStyle(viewModel.selectedMenuSegment == segment ? .black01 : .gray04)
                .padding(.top, 6)
                .onTapGesture {
                    viewModel.selectedMenuSegment = segment
                }
            Image("new")
                .resizable()
                .frame(width: 14, height: 6.5)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 18)
    }
    
    
    private var tabview: some View {
        TabView(selection: $viewModel.selectedSegment, content: {
            ForEach(OrderSegment.allCases, id: \.id) { segment in
                contentView(for: segment)
                    .tag(segment)
            }
        })
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.default, value: viewModel.selectedSegment)
    }
    
    @ViewBuilder
    func contentView(for segment: OrderSegment) -> some View {
        switch segment {
            
        case .first:
            TabView(selection: $viewModel.selectedMenuSegment) {
                ForEach(MenuSegment.allCases, id: \.id) { menuSegment in
                    OrderAllMenuView(for: menuSegment)
                        .tag(menuSegment)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut(duration: 0.3), value: viewModel.selectedMenuSegment)
            
        case .second:
            OrderMyMenuView
            
        case .third:
            OrderWholeCakeView
        }
    }
    
    @ViewBuilder
    func OrderAllMenuView(for segement: MenuSegment) -> some View {
        switch segement {
        case .first:
            OrderBeverageView
        case .second:
            OrderFoodView
        case .third:
            OrderProductView
        }
    }
    
    private var OrderMyMenuView: some View {
        Text("나만의 메뉴")
    }
    
    private var OrderWholeCakeView: some View {
        Text("홀케이크 예약")
    }
    
    private var OrderBeverageView: some View {
        ScrollView {
            Spacer().frame(height: 19)
            LazyVStack (spacing: 26) {
                ForEach(viewModel.OrderBeverageMenus, id: \.id) { menu in
                    Button(action: {
                        
                    }, label: {
                        MenuItemCard(menu: menu)
                    })
                }
            }
            .padding(.top, 0)
            .padding(.horizontal, 23)
        }
        .scrollIndicators(.hidden)
    }
    
    private var OrderFoodView: some View {
        Text("푸드")
    }
    
    private var OrderProductView: some View {
        Text("상품")
    }
    
}

#Preview {
    OrderView()
}

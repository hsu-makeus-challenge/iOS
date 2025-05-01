//
//  OrderView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct OrderView: View {
    
    @Bindable var viewModel: OrderViewModel = .init()
    
    var body: some View {
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
        
            HStack {
                ForEach(MenuSegment.allCases, id: \.id) { segment in
                    BottomSegment(segment: segment)
                }
            }
            .padding(.leading, 23)
            
            Divider()
                .padding(.top, -6)
            
            tabview
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
            Rectangle()
                .fill(viewModel.selectedSegment == segment ? Color.green01 : .gray.opacity(0.2))
                .frame(height: 3)
                .shadow(color: .black.opacity(0.15), radius: 1.5, x: 0, y: 3)
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    func BottomSegment(segment: MenuSegment) -> some View {
        VStack(spacing: 0) {
            HStack(spacing: -2) {
                Text(segment.title)
                    .font(.mainTextSemiBold16)
                    .foregroundStyle(viewModel.selectedMenuSegment == segment ? .black01 : .gray04)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 18)
                    .onTapGesture {
                        viewModel.selectedMenuSegment = segment
                    }
                Image("new")
                    .resizable()
                    .frame(width: 14, height: 6.5)
            }
        }
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
            OrderAllMenuView(menuSegment: viewModel.selectedMenuSegment)
        case .second:
            OrderMyMenuView
        case .third:
            OrderWholeCakeView
        }
    }

    struct OrderAllMenuView: View {
        var menuSegment: MenuSegment

        var body: some View {
            VStack {
                switch menuSegment {
                case .first:
                    Text("음료")
                case .second:
                    Text("푸드")
                case .third:
                    Text("상품")
                }
            }
        }
    }
    
    private var OrderMyMenuView: some View {
        Text("나만의 메뉴")
    }
    
    private var OrderWholeCakeView: some View {
        Text("홀케이크 예약")
    }
}

#Preview {
    OrderView()
}

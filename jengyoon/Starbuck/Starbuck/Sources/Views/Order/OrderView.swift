//
//  OrderView.swift
//  Starbuck
//
//  Created by 송승윤 on 5/4/25.
//

import SwiftUI

// MARK: - 메인 오더 뷰
// 역할: UI 표시 및 ViewModel로부터 상태를 주입받아 뷰를 구성
struct OrderView: View {
    @StateObject private var viewModel = OrderViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            // 상단 타이틀 (Order)
            OrderHeaderView
            
            // 상단 세그먼트 (전체/나만의/홀케이크 예약)
            OrderSegmentView(selectedSegment: $viewModel.selectedSegment)
            
            // 하단 메뉴 세그먼트 (음료/푸드/상품)
            MenuSegmentView(menuSegment: $viewModel.menuSegment)
                .padding(.horizontal, 20)
            
            // 필터링된 메뉴 리스트
            CoffeeMenuList(menuItems: viewModel.filteredItems)
            
            Spacer()
        }
    }
    
    // 헤더 뷰 정의
    private var OrderHeaderView: some View {
        HStack {
            Text("Order")
                .font(.PretendardBold24)
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

// MARK: - Preview
#Preview {
    OrderView()
}

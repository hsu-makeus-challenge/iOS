//
//  ReceiptView.swift
//  Starbuck
//
//  Created by 송승윤 on 4/10/25.
//

import SwiftUI

struct ReceiptView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 0) {
            // 상단 네비게이션 바
            CustomNavigationBar(title: "전자영수증") {
                dismiss()
            }
            .padding(.bottom, 10)
            
            // 하단 영역에만 배경색 적용
            ZStack {
                Color(.white01)
                    .ignoresSafeArea(edges: .bottom)

                VStack {
                    Text("Hello, World!")
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
    }
}
#Preview {
    ReceiptView()
}

//
//  OrderStoreSelectBar.swift
//  Starbuck
//
//  Created by 송승윤 on 5/4/25.
//

import SwiftUI

struct OrderStoreSelectBar: View {
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        Button(action: {isSheetPresented = true}) {
            HStack {
                Text("주문할 매장을 선택해 주세요")
                    .foregroundStyle(Color.white)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundStyle(Color.white)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(Color.black02)
        }
    }
}


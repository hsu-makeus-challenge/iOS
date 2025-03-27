//
//  OtherView.swift
//  Starbuck
//
//  Created by 송승윤 on 3/27/25.
//

import SwiftUI

struct OtherView: View {
    @AppStorage("nickname") private var nickname : String = ""
    
    var body: some View {
        otherHeaderView
        
        Spacer()
        
        ZStack {
            Color.gray00
            Text("\(nickname)님\n 환영합니다!")
        }
        
        
    }
    
    private var otherHeaderView: some View {
        HStack {
            Text("Other")
                .font(.PretendardExtraBold24)
            Spacer()
            Image("logout")
        }
        .padding(.horizontal, 20)
    }
    
    private var otherPayView: some View {
        HStack(spacing: 4) {
            Image("pay1")
            Text("스타벅스 카드 등록")
        }
    }
}



#Preview {
    OtherView()
}

//
//  OtherView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/27/25.
//

import SwiftUI

struct OtherView: View {
    
    var body: some View {
        VStack {
            OtherHeaderView()
            
            Spacer().frame(height: 41)
            
            OtherWelcomeView()
        }
        .background(Color(.white01))
    }
}

struct OtherHeaderView: View {
    var body: some View {
        HStack {
            Text("Other")
                .font(.mainTextBold24)
                .foregroundStyle(.black)
            
            Spacer()
            
            Image(.logoutIcon)
                .resizable()
                .frame(width: 35, height: 35)
        }
        .padding(.horizontal, 23.5)
        .frame(height: 80)
        .background(Color.white)
    }
}

struct OtherWelcomeView: View {
    
    @AppStorage("nickname") private var nickname: String?
    
    var body: some View {
        VStack {
            Group {
                if let nickname {
                    Text("\(nickname)")
                        .foregroundStyle(Color(.green01))
                    + Text("님")
                        .foregroundStyle(.black)
                } else {
                    Text("(작성한 닉네임)")
                        .foregroundStyle(Color(.green01))
                    + Text("님")
                        .foregroundStyle(.black)
                }
                
                Text("환영합니다🙌")
                    .foregroundStyle(.black)
            }
            .font(.mainTextBold24)
            
            Spacer().frame(height: 24)
            
            HStack(spacing: 10.5) {
                ShortcutButtonView(
                    image: .starHistoryIcon,
                    imageLabel: "별 히스토리"
                )
                
                ShortcutButtonView(
                    image: .receiptIcon,
                    imageLabel: "전자영수증"
                )
                
                ShortcutButtonView(
                    image: .myMenuIcon,
                    imageLabel: "나만의 메뉴"
                )
            }
        }
    }
}

#Preview {
    OtherView()
}

//
//  Button.swift
//  Starbuck
//
//  Created by 송승윤 on 3/20/25.
//

import Foundation
import SwiftUI

/*
 < 사용예제 >
 RoundedButton(color: .yellow,
 textColor: .black, text: "카카오",
 font: .PretendardMedium16, icon: "kakao", action: {})
 */

/// 소셜 로그인 버튼
struct SocialLoginButton: View {
    
    let buttonColor: Color       // 버튼 배경색
    let textColor: Color   // 텍스트 색상
    let text: String       // 버튼 텍스트
    let font: Font
    let icon: String?      // 아이콘 파일명 (Asset에서 불러옴)
    let action: () -> Void // 버튼 클릭 시 동작
    
    init(buttonColor: Color,
         textColor: Color,
         text: String,
         font: Font,
         icon: String? = nil,
         action: @escaping () -> Void) {
        self.buttonColor = buttonColor
        self.textColor = textColor
        self.text = text
        self.font = font
        self.icon = icon
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack() {
                if let icon = icon {
                    Image(icon) // Asset에서 아이콘 로드
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16) // 아이콘 크기 설정
                        .padding(.leading, 20)
                }
                
                Text(text)
                    .font(font)
                    .foregroundColor(textColor)
                    .padding(.leading, 70)
                    
                Spacer()
            }
            .frame(width: 306, height: 45) //  버튼 크기 설정
            .background(buttonColor)
            .cornerRadius(10) // 모서리 둥글게
        }
        .frame(width: 306, height: 45)
    }
}

//
//  BasicButton.swift
//  Starbuck
//
//  Created by 송승윤 on 4/5/25.
//

import SwiftUI


/// 기본 버튼 컴포넌트
struct BasicButton: View {
    
    let buttonColor: Color // 버튼 배경색
    let textColor: Color // 텍스트 색상
    let text: String // 버튼 텍스트
    let font: Font // 버튼 폰트
    let action: () -> Void
    
    init(buttonColor: Color, textColor: Color, text: String, font: Font, action: @escaping () -> Void) {
        self.buttonColor = buttonColor
        self.textColor = textColor
        self.text = text
        self.font = font
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(font)
                .foregroundColor(textColor)
                .frame(maxWidth: 400, minHeight: 45)
                .background(buttonColor)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

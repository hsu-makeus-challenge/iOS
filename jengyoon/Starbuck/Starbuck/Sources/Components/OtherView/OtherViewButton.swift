//
//  OtherViewButton.swift
//  Starbuck
//
//  Created by 송승윤 on 3/28/25.
//

import SwiftUI

/// OtherView 버튼 컴포넌트 정의
struct OtherViewButton: View {
    
    // MARK: - Parameter 정의
    let text: String
    let textColor: Color
    let font: Font
    let icon: String?
    let action: () -> Void
    
    // MARK: - Init
    
    init(
        text: String,
        textColor: Color,
        font: Font,
        icon: String? = nil,
        action: @escaping () -> Void) {
            self.text = text
            self.textColor = textColor
            self.font = font
            self.icon = icon
            self.action = action
        }
    
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                if let icon = icon {
                    // 버튼 아이콘 패딩 설정 및 프레임 설정
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(.all, 4)
                }
                
                Text(text)
                    .font(font)
                    .foregroundStyle(textColor)
            }
        }
    }
}


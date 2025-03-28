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
    let font: Font
    let icon: String?
    let action: () -> Void
    
    // MARK: - Init
    
    init(
        text: String,
        font: Font,
        icon: String? = nil,
        action: @escaping () -> Void) {
            self.text = text
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
                        .frame(width: 24, height: 16)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 8)
                }
                
                Text(text)
                    .font(font)
            }
            .frame(width: 157)
        }
    }
}


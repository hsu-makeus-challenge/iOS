//
//  OtherViewButton2.swift
//  Starbuck
//
//  Created by 송승윤 on 3/28/25.
//

import SwiftUI

/// OtherView 컴포넌트 분리
struct OtherViewButton2: View {
    
    // MARK: - Parameter
    let buttonColor: Color
    let text: String
    let font: Font
    let icon: String?
    let action: () -> Void
    
    // MARK: - Init
    init(
        buttonColor: Color,
        text: String,
        font: Font,
        icon: String? = nil,
        action: @escaping () -> Void
    ){
        self.buttonColor = buttonColor
        self.text = text
        self.font = font
        self.icon = icon
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .center, spacing: 4) {
                Spacer()
                
                if let icon = icon {
                    // 버튼 아이콘 패딩 설정 및 프레임 설정
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                }
                
                Text(text)
                    .font(font)
                
                Spacer()
            } //: VStack
            .frame(width: 102, height: 108)
            .background(buttonColor)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        } //: Btn
    }
}

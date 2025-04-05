//
//  CoffeeTemperatureSelector.swift
//  Starbuck
//
//  Created by 송승윤 on 4/4/25.
//

import SwiftUI

/// 커피 상세정보 뷰 Iced/Hot 토글 버튼 Selector
struct CoffeeTemperatureSelector: View {
    let type: CoffeeTemperatureType
    
    /// 바인딩으로 선언한 이유
    /// 이 View 내부에서 옵션을 선택해도, 외부 View(CoffeeDetailView)에서도 상태를 알고 있어야 하기 때문에 선언하였음.
    @Binding var selectedOption: CoffeeOption?
    
    var body: some View {
        HStack {
            // type.option는 현재 커피의 온도 타입에 따라 나타날 버튼을 결정한다. iced, hot, icedOnly, hotOnly
            ForEach(type.options) { option in
                Button(action: {
                    withAnimation {
                        // 버튼 선택시 애니메이션과 함께 색상을 바꿈
                        selectedOption = option
                    }
                }) {
                    Text(option.rawValue)
                        .font(.PretendardRegular18)
                        .foregroundStyle(getTextColor(for: option))
                        .padding()
                        .frame(maxWidth: 420, maxHeight: 36)
                        .background(
                            selectedOption == option ? Color.white01 : Color.gray.opacity(0.4)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
            }
        } //: ForEach
    }
    
    /// 선택된 옵션에 따라 텍스트 색상을 바꿔주는 함수 ( ICED : blue , Hot: red)
    private func getTextColor(for option: CoffeeOption) -> Color {
        guard selectedOption == option else {
            return .black01 // 선택되지 않았으면 검은색
        }
        
        switch option {
        case .iced:
            return .blue
        case .hot:
            return .red
        }
    }
}

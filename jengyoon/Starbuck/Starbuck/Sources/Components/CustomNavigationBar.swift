//
//  CustomNavigationBar.swift
//  Starbuck
//
//  Created by 송승윤 on 4/2/25.
//

import SwiftUI

/// 네비게이션바 커스텀
/// SwiftUI에서는 현재 네비게이션 바 커스텀하려면 뒤로가기버튼 숨김처리하고 뷰를 직접 만드는 방법을 주로 사용한다.
struct CustomNavigationBar: View {
    let title: String
    let onBack: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onBack) {
                Image(systemName: "chevron.left")
                    .foregroundStyle(Color.black)
            }
            
            Spacer()
            
            Text(title)
                .font(.PretendardMedium16)
            
            Spacer()
        }
        .padding(.leading, 19)
    }
}

//
//  CustomNavigationBar.swift
//  Starbuck
//
//  Created by 송승윤 on 4/2/25.
//

import SwiftUI

/// 네비게이션바 커스텀
/// SwiftUI에서는 현재 네비게이션 바 커스텀하려면 뒤로가기버튼 숨김처리하고 뷰를 직접 만드는 방법을 주로 사용한다.
/// - Parameters
/// - title: navigationTitle 부분, String받아와 title지정 해줌
/// - onback: 뒤로가기 콜백함수 SignUpView에서는 dismiss를 받아온다.
/// - onPlus: plus 콜백함수
struct CustomNavigationBar: View {
    let title: String
    let onBack: () -> Void
    let onPlus: () -> Void
    
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
            
            Button(action: onPlus){
                Image(systemName: "plus")
                    .foregroundStyle(Color.black)
            }
        }
    }
}

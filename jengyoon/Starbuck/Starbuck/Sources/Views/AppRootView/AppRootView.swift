//
//  AppRootView.swift
//  Starbuck
//
//  Created by 송승윤 on 4/10/25.
//

import SwiftUI

/// 앱의 진입점을 담당하는 루트 뷰입니다.
/// 실행 시 SplashView를 잠깐 보여주고, 일정 시간 후 MainView로 전환됩니다.
struct AppRootView: View {
    
    /// 앱 실행 후 SplashView를 보여줄지 여부를 결정하는 상태 변수
    @State private var isLaunching = true

    var body: some View {
        ZStack {
            if isLaunching {
                SplashView()
                    .transition(.opacity) // 페이드 인/아웃 전환 효과
            } else {
                MainView()
            }
        }
        .onAppear {
            // 앱이 시작된 후 1초 뒤에 SplashView를 사라지게 함
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.easeOut(duration: 0.8)) {
                    isLaunching = false
                }
            }
        }
    }
}

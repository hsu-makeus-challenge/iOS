//
//  ContentView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import SwiftUI

/// 앱 실행 직후 표시되는 루트 뷰
/// SplashView를 잠깐 보여준 후 로그인 여부에 따라 MainTabView 또는 LoginView로 분기
struct ContentView: View {
    
    /// 앱 전역 상태 및 서비스에 접근하기 위한 환경 객체
    @EnvironmentObject private var env: AppEnvironment
    
    /// SplashView 노출 여부를 관리하는 상태 값
    @State private var showSplash: Bool = true
    
    var body: some View {
        if showSplash {
            SplashView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        showSplash = false
                    }
                }
        } else {
            if env.authStore.isLoggedIn {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppEnvironment.previewEnv)
}

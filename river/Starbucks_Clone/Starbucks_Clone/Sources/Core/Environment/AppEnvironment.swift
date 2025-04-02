//
//  AppEnvironment.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import Foundation

/// 앱 전역에서 공유되는 의존성들을 담고 있는 컨테이너 객체.
/// Router, AuthService, AuthStore 등 전역적으로 필요한 객체들을 보관하며
/// `.environmentObject()` 또는 `.environment()`를 통해 뷰에 주입.
final class AppEnvironment: ObservableObject {
    
    /// 프리뷰용 AppEnvironment. Mock 객체를 통해 프리뷰에서 안전하게 동작하도록 구성됨.
    static let previewEnv = AppEnvironment(
        router: NavigationRouter(),
        authService: AuthService(),
        authStore: AuthStore()
    )
    
    /// 화면 전환을 담당하는 라우터
    var router: NavigationRouter
    
    /// 인증 요청 처리를 담당하는 서비스
    let authService: AuthServiceProtocol
    
    /// 로그인 상태를 관리하는 Store
    let authStore: AuthStoreProtocol
    
    /// AppEnvironment를 초기화
    init(
        router: NavigationRouter,
        authService: AuthServiceProtocol,
        authStore: AuthStoreProtocol
    ) {
        self.router = router
        self.authService = authService
        self.authStore = authStore
    }
    
    /// LoginViewModel 생성 팩토리 함수
    func makeLoginViewModel() -> LoginViewModel {
        LoginViewModel(router: router)
    }
}

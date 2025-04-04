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
    
    init() {
        /// 커스텀 뒤로가기 버튼 이미지를 설정
        let backButtonImage = UIImage(resource: .backButton)
        // preparingThumbnail(of:)는 UIImage의 크기를 원하는 사이즈로 축소(thumbnail)해주는 메서드
        // iOS 15부터 사용할 수 있으며, 이미지 리사이징을 간단하고 효율적으로 수행할 수 있는 API
        let resizedImage = backButtonImage.preparingThumbnail(
            of: CGSize(width: 24, height: 24)
        )?.withRenderingMode(.alwaysOriginal)
        
        /// 새로운 UINavigationBarAppearance를 생성하고 투명 배경으로 구성
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        
        /// 설정한 커스텀 이미지를 뒤로가기 버튼으로 지정
        appearance.setBackIndicatorImage(
            resizedImage,
            transitionMaskImage: resizedImage
        )
        
        /// 'Back'이라는 텍스트가 기본으로 표시되는데, 이를 완전히 숨기기 위해 텍스트 색상을 투명하게 설정.
        /// 텍스트 자체는 존재하지만 시각적으로 보이지 않게 처리한 것임
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.backButtonAppearance = backButtonAppearance

        /// 설정한 Appearance를 모든 UINavigationBar에 적용
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationStack(path: $env.router.path) {
            Group {
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
                        LoginView(loginViewModel: env.makeLoginViewModel())
                    }
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .signup(let title):
                    SignupView(signupViewModel: env.makeSignupViewModel())
                        .navigationTitle(title)
                case .login:
                    LoginView(loginViewModel: env.makeLoginViewModel())
                case .menuDeatile(let menuID):
                    /// 상위 뷰에서 StateObject로 선언하지 않아도 하위 뷰에서 ObservedObject로 받으면 바인딩 연결됨
                    /// `MenuDetailView`는 추천 음료를 누르면 해당 뷰로 이동하는 것이기 때문에, 매번 새로운 ViewModel 인스턴스가 생성되어야 하는 구조임.
                    /// 이 구조에서는 EnvironmentObject로 주입하는 것보다 아래의 방식으로 하는 것이 이상적임.
                    /// [참고] EnvironmentObject를 쓰면 좋은 구조
                    ///     - 전체 메뉴 리스트
                    ///     - 장바구니 상태
                    ///     - 로그인/유저 상태
                    ///     - 테마 설정,위치 정보 등
                    if let menuDetailModel = MenuDetailModel.mockData.first(where: { $0.menuID == menuID }) {
                        let _ = print(menuDetailModel)
                        let viewModel = env.makeMenuDetailViewModel(with: menuDetailModel)
                        MenuDetailView(menuDetailViewModel: viewModel, menuID: menuID)
                    }
                case .mainTap:
                    MainTabView()
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(AppEnvironment.previewEnv)
}

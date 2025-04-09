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
    @AppStorage("showAdvertisement") private var showAdvertisement: Bool = true
    
    /// 앱 전역 상태 및 서비스에 접근하기 위한 환경 객체
    @EnvironmentObject private var env: AppEnvironment
    
    /// SplashView 노출 여부를 관리하는 상태 값
    @State private var showSplash: Bool = true
    
    init() {
        GlobalNavigationBarStyle.apply()
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
                case .menuDeatile(let menuID, let temperatureType):
                    /// [뷰 전환 시 ViewModel 주입 방식 설명] (제 코드 보게 된다면 읽어보길 바랍니다)
                    /// `MenuDetailView`는 추천 음료 클릭 시 이동되므로, 매번 새로운 ViewModel 인스턴스가 필요함
                    /// 그래서 StateObject가 아닌, 상위에서 생성 후 ObservedObject로 주입하는 방식을 채택
                    ///
                    /// [Navigation 흐름 요약]
                    /// HomeViewModel → NavigationRouter → (menuID, temperatureType) → MenuDetailViewModel → MenuDetailView
                    ///
                    /// 1. 사용자가 HomeView에서 추천 음료를 탭함
                    /// 2. NavigationRouter를 통해 menuID와 temperatureType이 전달됨
                    /// 3. 여기서 해당 정보를 기반으로 MenuDetailModel을 조회하여 ViewModel 생성
                    /// 4. MenuDetailView에 ViewModel을 직접 주입하여 상태 관리
                    ///
                    /// [왜 EnvironmentObject를 사용하지 않았는가?]
                    /// - MenuDetailViewModel은 개별 메뉴에 종속된 상태 → 전역 공유 대상이 아님
                    /// - 전역 공유가 필요한 값(예: 로그인, 장바구니 등)에는 EnvironmentObject가 적합
                    ///
                    /// [EnvironmentObject가 적합한 예시]
                    /// - 전체 메뉴 리스트
                    /// - 장바구니 상태
                    /// - 로그인/유저 인증 상태
                    /// - 앱 테마, 위치 정보, 사용자 설정 등
                    if let menuDetailModel = MenuDetailModel.mockData.first(
                        where: { $0.menuID == menuID }
                    ) {
                        let menuDetailViewModel = env.makeMenuDetailViewModel(
                            with: menuDetailModel,
                            selectedTemperatureType: temperatureType
                        )
                        MenuDetailView(menuDetailViewModel: menuDetailViewModel)
                    }
                case .mainTap:
                    MainTabView()
                        .onAppear {
                            if showAdvertisement {
                                env.router.present(.fullScreenAd)
                            }
                        }
                case .receipt:
                    ReceiptView()
                }
            }
        }
        // fullScreenCover(item:)은 Optional<T: Identifier> 타입으로,
        // 내부적으로 nil이면 닫고, 특정 id가 오면 여는 구조임
        .fullScreenCover(
            item: $env.router.actionModal
        ) { modal in
            switch modal {
            case .fullScreenAd:
                AdvertisementView()
            case .mainTab:
                MainTabView()
                    .onAppear {
                        if showAdvertisement {
                            env.router.present(.fullScreenAd)
                        }
                    }
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews : some View {
        let previewEnv = AppEnvironment.previewEnv
        ForEach(
            PREVIEW_DEVICE_TYPE.allCases,
            id: \.self
        ) { deviceType in
            ContentView()
                .environmentObject(previewEnv)
        }
    }
}

import SwiftUI

/// 앱의 메인 뷰로, 네비게이션과 로그인 상태를 관리합니다.
struct MainView: View {
    /// 네비게이션 라우터를 관리하는 상태 객체
    @StateObject private var router = NavigationRouter()
    
    var body: some View {
        // 네비게이션 스택을 사용하여 화면 전환을 관리
        NavigationStack(path: $router.path) {
            Group {
                // 로그인 상태에 따라 다른 뷰를 표시
                if router.isLoggedIn {
                    StarBuckTab() // 로그인 시 메인 탭 뷰 표시
                } else {
                    LoginView() // 비로그인 시 로그인 뷰 표시
                }
            }
            // 각 라우트에 따른 목적지 뷰를 정의
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .login:
                    LoginView()
                case .signup:
                    SignupView()
                case .home:
                    HomeView()
                case .shop:
                    ShopView()
                case .coffeeDetail(let coffeeName):
                    CoffeeDetailView(coffeeName: coffeeName)
                }
            }
        }
        // 라우터를 환경 객체로 주입하여 모든 하위 뷰에서 접근 가능하도록 함
        .environmentObject(router)
    }
} 
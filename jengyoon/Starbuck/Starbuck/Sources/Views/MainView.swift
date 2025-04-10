import SwiftUI

/// 앱의 루트 뷰. 로그인 여부에 따라 초기 화면을 다르게 보여주며,
/// 앱 전체에서 사용할 라우터를 환경 객체로 주입합니다.
struct MainView: View {
    
    /// 화면 전환을 관리할 라우터 객체 (NavigationRouter는 커스텀 라우터로 추정)
    @StateObject private var router = NavigationRouter()
    
    var body: some View {
        // iOS 16 이상에서 사용되는 네비게이션 스택
        // router.path는 현재 네비게이션 경로를 바인딩
        NavigationStack(path: $router.path) {
            
            Group {
                // 로그인 여부에 따라 다른 뷰를 보여줌
                if router.isLoggedIn {
                    StarBuckTab() // 로그인된 경우: 탭 기반 메인 화면
                } else {
                    LoginView()   // 로그인되지 않은 경우: 로그인 화면
                }
            }
            // 특정 경로(AppRoute)에 따라 해당 화면으로 이동하도록 설정
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
                case .other:
                    OtherView()
                }
            }
        }
        // 전체 하위 뷰에서 router 객체를 공유할 수 있도록 환경 객체로 주입
        .environmentObject(router)
    }
}

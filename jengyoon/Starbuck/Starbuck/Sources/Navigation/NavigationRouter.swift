import SwiftUI

/// 앱의 라우팅을 관리하는 열거형
enum AppRoute: Hashable {
    case login
    case signup
    case home
    case shop
    case coffeeDetail(String)  // 커피 이름을 파라미터로 받음
    case other
}

/// 네비게이션 상태를 관리하는 뷰모델
class NavigationRouter: ObservableObject {
    @Published var path = NavigationPath()
    @Published var isLoggedIn = false
    
    func navigate(to route: AppRoute) {
        path.append(route)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func navigateToRoot() {
        path.removeLast(path.count)
    }
} 

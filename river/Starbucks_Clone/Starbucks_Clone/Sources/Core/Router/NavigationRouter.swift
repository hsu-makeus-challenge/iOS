//
//  NavigationRouter.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import SwiftUI

/// 앱 내 라우팅을 위한 Route 정의
/// 각각의 케이스는 네비게이션 스택에서 하나의 화면에 해당
enum Route: Hashable {
    case login
    case signup(title: String)
    case mainTap
    case menuDeatile(
        menuID: MenuID,
        temperatureType: TemperatureType
    )
}

/// 네비게이션 상태를 관리하는 라우터
/// NavigationStack과 함께 사용되며, 뷰 전환을 제어
@Observable
class NavigationRouter {
    
    /// 현재 네비게이션 스택의 경로를 나타냄.
    var path = NavigationPath()
    
    /// 지정한 route를 스택에 추가하여 화면을 푸시
    func push(_ route: Route) {
        path.append(route)
    }
    
    /// 스택에서 가장 마지막 화면을 제거하여 뒤로 이동
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    /// 네비게이션 스택을 초기화하여 최상위로 이동
    func reset() {
        path = NavigationPath()
    }
}

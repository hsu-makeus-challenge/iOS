//
//  NavigationRouter.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 4/3/25.
//

import Foundation
import SwiftUI

//@Observable
class NavigationRouter: ObservableObject {
    @Published var path = NavigationPath()  // 네비게이션 경로를 저장하는 변수
    
    /// 특정 화면을 추가 (Push 기능)
    func push(_ route: Route) {
        path.append(route)
    }
    
    /// 마지막 화면 제거 (Pop 기능)
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    /// 네비게이션 초기화 (전체 Pop)
    func reset() {
        path = NavigationPath()
    }
    
    func setPath(_ newPath: [Route]) {
            path = NavigationPath() // 먼저 경로 초기화 (pop to root)
            newPath.forEach { path.append($0) } // 새로운 경로들을 스택에 쌓기
        }
}

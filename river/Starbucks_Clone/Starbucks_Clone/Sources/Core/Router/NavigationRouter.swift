//
//  NavigationRouter.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import SwiftUI

enum Route: Hashable {
    case login
    case signup
}

@Observable
class NavigationRouter {
    private var path = NavigationPath()
    
    func push(_ route: Route) {
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func reset() {
        path = NavigationPath()
    }
}

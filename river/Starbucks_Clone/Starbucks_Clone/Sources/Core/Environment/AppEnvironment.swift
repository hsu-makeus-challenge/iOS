//
//  AppEnvironment.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import Foundation

final class AppEnvironment: ObservableObject {
    static let previewEnv = AppEnvironment(
        router: NavigationRouter(),
        authService: AuthService()
    )
    
    let router: NavigationRouter
    let authService: AuthServiceProtocol
    
    init(
        router: NavigationRouter,
        authService: AuthServiceProtocol
    ) {
        self.router = router
        self.authService = authService
    }
}

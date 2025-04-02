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
        authService: AuthService(),
        authStore: AuthStore()
    )
    
    let router: NavigationRouter
    let authService: AuthServiceProtocol
    let authStore: AuthStoreProtocol
    
    init(
        router: NavigationRouter,
        authService: AuthServiceProtocol,
        authStore: AuthStoreProtocol
    ) {
        self.router = router
        self.authService = authService
        self.authStore = authStore
    }
}

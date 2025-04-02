//
//  AuthStore.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import Foundation

protocol AuthStoreProtocol {
    var isLoggedIn: Bool { get }
    func login()
    func logout()
}

@Observable
final class AuthStore: AuthStoreProtocol {
    var isLoggedIn: Bool = false

    func login() {
        isLoggedIn = true
    }

    func logout() {
        isLoggedIn = false
    }
}

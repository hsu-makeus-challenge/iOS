//
//  AuthService.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import Foundation

protocol AuthServiceProtocol {
    var isLoggedIn: Bool { get }
    func login()
    func logout()
}

final class AuthService: AuthServiceProtocol {
    private(set) var isLoggedIn: Bool = false
    
    func login() {
        isLoggedIn = true
        print("Login Successfully")
    }
    
    func logout() {
        isLoggedIn = false
        print("Logout Successfully")
    }
}

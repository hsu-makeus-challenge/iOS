//
//  AuthService.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import Foundation

protocol AuthServiceProtocol {
    func login(completion: @escaping (Bool) -> Void)
    func logout()
}

final class AuthService: AuthServiceProtocol {
    func login(completion: @escaping (Bool) -> Void) {
        // 예: 실제 API 요청
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(true) // 성공 응답
        }
    }

    func logout() {
        print("Logged out")
    }
}

//
//  AuthService.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import Foundation

/// 인증 관련 기능을 담당하는 서비스 프로토콜.
/// 실제 API 요청을 통해 로그인/로그아웃 로직을 처리.
protocol AuthServiceProtocol {
    /// 로그인 요청을 수행하고, 성공 여부를 비동기로 전달.
    func login(completion: @escaping (Bool) -> Void)

    /// 로그아웃 요청을 수행.
    func logout()
}

/// 인증 서비스의 기본 구현체.
/// 추후 실제 API 요청으로 교체될 수 있는 구조.
final class AuthService: AuthServiceProtocol {

    /// 서버에 로그인 요청을 보내고, 1초 후 성공했다고 가정.
    func login(completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(true)
        }
    }

    /// 로그아웃 처리.
    func logout() {
        print("Logged out")
    }
}

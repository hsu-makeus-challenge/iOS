//
//  AuthStore.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import Foundation

/// 로그인 상태를 관리하는 Store 객체입니다.
/// `isLoggedIn` 값을 통해 로그인 여부를 추적하며,
/// UI와 직접적으로 연결되는 상태값입니다.
protocol AuthStoreProtocol {
    var isLoggedIn: Bool { get }
    func login()
    func logout()
}

/// 로그인 여부를 저장하고 상태를 변경하는 클래스.
/// SwiftUI의 상태 업데이트와 연동되도록 `@Observable`을 채택.
@Observable
final class AuthStore: AuthStoreProtocol {
    
    /// 로그인 여부를 나타내는 상태 값
    var isLoggedIn: Bool = false

    /// 로그인 성공 시 호출
    func login() {
        isLoggedIn = true
    }

    /// 로그아웃 시 호출
    func logout() {
        isLoggedIn = false
    }
}

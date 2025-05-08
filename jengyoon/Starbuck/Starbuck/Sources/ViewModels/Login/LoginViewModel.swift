//
//  LoginViewModel.swift
//  Starbuck
//
//  Created by 송승윤 on 3/19/25.
//

import Foundation
import SwiftUI

/// 로그인 화면에서 사용하는 ViewModel
class LoginViewModel: ObservableObject {
    
    // MARK: - 로그인 입력값 (UI에서 바인딩)
    /// Subscriber(구독자)에게 값을 방출하기 위해 값을 게시 @Published사용
    @Published var inputEmail: String = ""
    @Published var inputPassword: String = ""
    
    // MARK: - 로그인 상태
    @Published var isLogin: Bool = false
    @Published var loginError: String? = nil
    
    // MARK: - 로그인 로직
    func login() {
        guard let savedEmail = KeychainWrapper.load(for: .email),
              let savedPassword = KeychainWrapper.load(for: .password) else {
            loginError = "저장된 사용자 정보가 없습니다."
            isLogin = false
            return
        }
        
        if (inputEmail == savedEmail && inputPassword == savedPassword) {
            isLogin = true
            loginError = nil
        } else {
            isLogin = false
            loginError = "이메일 또는 비밀번호가 일치하지 않습니다."
        }
    }
    
    var buttonValid: Bool {
        !inputEmail.isEmpty && !inputPassword.isEmpty
    }
}

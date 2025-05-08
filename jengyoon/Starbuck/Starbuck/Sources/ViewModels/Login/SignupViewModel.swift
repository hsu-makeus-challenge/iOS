//
//  SignupViewModel.swift
//  Starbuck
//
//  Created by 송승윤 on 3/27/25.

/// 회원가입 화면에서 사용하는 ViewModel
/// 사용자 입력값을 Keychain에 저장
import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    
    // 사용자 입력값
    @Published var email = ""
    @Published var password = ""
    @Published var nickname = ""
    
    // 회원가입 완료 여부
    @Published var isSignupComplete = false
    
    /// 입력 필드 검증 로직
    var isFormValid: Bool {
        !email.isEmpty && !password.isEmpty && !nickname.isEmpty
    }
    
    /// 회원가입 처리 함수
    /// 입력값을 Keychain에 저장한다.
    func signup() {
        KeychainWrapper.save(email, for: .email)
        KeychainWrapper.save(password, for: .password)
        KeychainWrapper.save(nickname, for: .nickname)
        
        // 회원가입 완료 처리
        isSignupComplete = true
    }
    
    /// Keycahin에서 기존 사용자 데이터를 불러와 필드에 반영하기
    func loadSavedUserData() {
        email = KeychainWrapper.load(for: .email) ?? ""
        password = KeychainWrapper.load(for: .password) ?? ""
        nickname = KeychainWrapper.load(for: .nickname) ?? ""
    }
    
    /// Keychain에 저장된 사용자 정보 삭제
    func clearUserData() {
        KeychainWrapper.delete(for: .email)
        KeychainWrapper.delete(for: .password)
        KeychainWrapper.delete(for: .nickname)
    }
}

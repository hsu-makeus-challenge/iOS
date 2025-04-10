import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    @AppStorage("userEmail") private var userEmail: String = ""
    @AppStorage("userPassword") private var userPassword: String = ""
    @AppStorage("userNickname") private var userNickname: String = ""
    
    @Published var email = ""
    @Published var password = ""
    @Published var nickname = ""
    @Published var isSignupComplete = false
    
    var isFormValid: Bool {
        !email.isEmpty && !password.isEmpty && !nickname.isEmpty
    }
    
    func signup() {
        // AppStorage에 사용자 정보 저장
        userEmail = email
        userPassword = password
        userNickname = nickname
        
        // 회원가입 완료 처리
        isSignupComplete = true
    }
} 
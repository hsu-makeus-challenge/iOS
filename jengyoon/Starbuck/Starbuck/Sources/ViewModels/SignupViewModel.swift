import Foundation

class SignupViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var isSignupComplete = false
    
    @Published var emailError: String?
    @Published var passwordError: String?
    @Published var confirmPasswordError: String?
    
    var isFormValid: Bool {
        !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty &&
        emailError == nil && passwordError == nil && confirmPasswordError == nil
    }
    
    func signup() {
        // 이메일 유효성 검사
        if !isValidEmail(email) {
            emailError = "올바른 이메일 형식이 아닙니다."
            return
        } else {
            emailError = nil
        }
        
        // 비밀번호 유효성 검사
        if password.count < 6 {
            passwordError = "비밀번호는 6자 이상이어야 합니다."
            return
        } else {
            passwordError = nil
        }
        
        // 비밀번호 확인 검사
        if password != confirmPassword {
            confirmPasswordError = "비밀번호가 일치하지 않습니다."
            return
        } else {
            confirmPasswordError = nil
        }
        
        // 회원가입 로직 구현
        // TODO: 실제 회원가입 API 연동
        
        // 임시로 회원가입 완료 처리
        isSignupComplete = true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
} 
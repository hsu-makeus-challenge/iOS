import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var nickname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @AppStorage("userNickname") var storedNickname: String = ""
    @AppStorage("userEmail") var storedEmail: String = ""
    @AppStorage("userPassword") var storedPassword: String = ""
    

    var isSignupEnabled: Bool {
        !nickname.isEmpty && !email.isEmpty && !password.isEmpty
    }
    
    func saveUser() {
        if nickname.count >= 1, email.count >= 1, password.count >= 1 {
            storedNickname = nickname
            storedEmail = email
            storedPassword = password
            print("저장 완료")
        } 
    }
}

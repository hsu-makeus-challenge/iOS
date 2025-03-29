import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var nickname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @AppStorage("userNickname") var storedNickname: String = ""
    @AppStorage("userEmail") var storedEmail: String = ""
    @AppStorage("userPassword") var storedPassword: String = ""
    
    func saveUser() {
        storedNickname = nickname
        storedEmail = email
        storedPassword = password
    }
}

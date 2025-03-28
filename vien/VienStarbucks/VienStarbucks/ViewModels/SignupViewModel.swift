import SwiftUI

///??? 솔직히 잘 모르겠어요. . 어렵
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

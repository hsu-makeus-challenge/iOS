//
//  SingupViewModel.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import Foundation
import Observation
import SwiftUI

//@Observable
class SignupViewModel: ObservableObject {
    
    @AppStorage("nickname") private var storedNickname: String?
    @AppStorage("email") private var storedEmail: String?
    @AppStorage("password") private var storedPassword: String?
        
    @Published var user: SignupModel = .init(
        nickname: "", email: "", pwd: ""
    )
    
    func saveUser(router: NavigationRouter) {
        storedNickname = user.nickname
        storedEmail = user.email
        storedPassword = user.pwd
        router.reset()
        print("사용자 회원가입 및 유저 정보 저장 완료")
        print("\(storedNickname ?? "초기닉네임"), \(storedEmail ?? "초기이메일"), \(storedPassword ?? "초기비밀번호")")
    }
    
    /// 닉네임, 이메일, 비밀번호가 비어있는지 확인 후, 회원가입 및 유저 정보 저장
    var isSignupEnabled: Bool {
        !user.nickname.isEmpty && !user.email.isEmpty && !user.pwd.isEmpty
    }
}

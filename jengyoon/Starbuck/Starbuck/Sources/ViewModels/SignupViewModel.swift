//
//  SignupViewModel.swift
//  Starbuck
//
//  Created by 송승윤 on 3/27/25.
//
import SwiftUI
import Foundation

/// 회원가입 화면에서 사용하는 ViewModel
/// 사용자 입력값을 AppStorage(UserDefaults)와 연동하여 저장
class SignupViewModel: ObservableObject {
    
    /// 닉네임,이메일,패스워드 - UserDefaults의 "nickname, email, password" 키와 연동
    /// 값이 저장되면 자동 저장되고 앱을 재실행 하더라도 유지된다.
    @AppStorage("nickname") var nickname: String = ""
    @AppStorage("email") var email = ""
    @AppStorage("password") var password: String = ""
}

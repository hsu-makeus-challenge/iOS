//
//  SignupViewModel.swift
//  Starbuck
//
//  Created by 송승윤 on 3/27/25.
//
import SwiftUI
import Foundation

@Observable
class SignupViewModel {
    var nickname: String = ""
    var email: String = ""
    var password: String = ""
    
    /// 생성하기 버튼을 누르면 @AppStorage에 저장할 수 있도록 하는 함수
    private func saveClient (nicknameStorage: inout String,
                             emailStorage: inout String,
                             passwordStorage: inout String) {
        nicknameStorage = nickname
        emailStorage = email
        passwordStorage = password
    }
}

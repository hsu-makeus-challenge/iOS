//
//  LoginViewModel.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/20/25.
//

import Foundation
import SwiftUI

@Observable
class LoginViewModel {

    var isLoggedIn: Bool = false
    var nickname: String = ""
    
    func autoLoginIfPossible() {
        if let id = KeychainService.shared.load(key: "user_id"),
           let pw = KeychainService.shared.load(key: "user_pw"),
           let nick = KeychainService.shared.load(key: "user_nickname") {
            print("자동 로그인 성공: \(id), \(pw)")
            self.nickname = nick
            self.isLoggedIn = true
        }
    }
}


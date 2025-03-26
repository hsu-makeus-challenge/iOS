//
//  LoginViewModel.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/20/25.
//

import Foundation
import Observation

@Observable
class LoginViewModel {
    var loginModel = LoginModel()
    
    func login() {
        print("로그인 성공")
        print("ID: \(loginModel.id), Password: \(loginModel.password)")
    }
}


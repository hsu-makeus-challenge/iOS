//
//  LoginViewModel.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/20/25.
//

import Foundation
import SwiftUI

//@Observable
class LoginViewModel:ObservableObject {
    @Published var loginModel: LoginModel = .init(id: "", password: "")
    
    @AppStorage("nickname") private var storedNickname: String?
    @AppStorage("email") private var storedEmail: String?
    @AppStorage("password") private var storedPassword: String?
    
    
    func login(router: NavigationRouter) {
        if loginModel.id == storedEmail && loginModel.password == storedPassword {
            router.setPath([.mainTabBar])
            print("로그인 성공")
            print("ID: \(loginModel.id), Password: \(loginModel.password)")
        }
    }
}


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
    @AppStorage("nickname") private var storedNickname: String = ""
    @AppStorage("email") private var storedEmail: String = ""
    @AppStorage("password") private var storedPassword: String = ""
    
    var user = SignupModel()
    
    func saveUser() {
        storedNickname = user.nickname
        storedEmail = user.email
        storedPassword = user.password
        print("사용자 회원가입 및 유저 정보 저장 완료")
    }
}

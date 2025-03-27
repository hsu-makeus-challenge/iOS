//
//  SignupViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/27/25.
//

import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    
    @AppStorage("isSignedUp") private var isSignedUp: Bool = false
    // 서버 연결한다면 필요 없음
    @AppStorage("nickname") private var nickname: String?
    @AppStorage("email") private var email: String?
    
    @Published private var signupModel: SignupModel = .init(nickname: "", email: "", pwd: "")
    
    func createUser(with model: SignupModel) {
        signupModel.nickname = model.nickname
        signupModel.email = model.email
        signupModel.pwd = model.pwd
        
        // 서버 통신 성공 가정
        isSignedUp = true
        
        nickname = model.nickname
        email = model.email
        
        print(signupModel)
    }
}

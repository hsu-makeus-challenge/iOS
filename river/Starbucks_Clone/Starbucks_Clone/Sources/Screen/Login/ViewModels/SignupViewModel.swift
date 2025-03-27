//
//  SignupViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/27/25.
//

import Foundation
import SwiftUI

@Observable
class SignupViewModel {
    
    @AppStorage("isSignedUp") private var isSignedUp: Bool = false
    private var signupModel: SignupModel = .init(nickname: "", email: "", pwd: "")
    
    func createUser(with model: SignupModel) {
        signupModel.nickname = model.nickname
        signupModel.email = model.email
        signupModel.pwd = model.pwd
        
        // 서버 통신 성공 가정
        isSignedUp = true
    }
}

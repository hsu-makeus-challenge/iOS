//
//  LoginViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/20/25.
//

import Foundation

@Observable
class LoginViewModel {
    private var loginModel: LoginModel = .init(id: "", pwd: "")
    
    // loginModel을 ViewModel 내부에 숨기고,
    // 외부에는 id/pwd만 노출함으로써 View와 바인딩은 간결하게 유지하고,
    // 내부적으로는 Codable을 준수한 loginModel을 그대로 서버 통신용 DTO로 활용 가능하게 설계함
    var id: String {
        get { loginModel.id }
        set { loginModel.id = newValue }
    }
    
    var pwd: String {
        get { loginModel.pwd }
        set { loginModel.pwd = newValue }
    }
    
    var isLoginEnabled: Bool {
        !id.isEmpty && !pwd.isEmpty
    }
    
    /// 사용자가 입력한 id/pwd가 비어 있는지 검증한 후, 로그인 요청 로직 실행
    func login() {
        guard !id.isEmpty, !pwd.isEmpty else {
            print("아이디와 비밀번호 입력해 주세요.")
            return
        }
        
        print("로그인 요청 \(id), \(pwd)")
    }
    
    
}

//
//  SignupViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/27/25.
//

import Foundation
import SwiftUI

/// 회원가입 로직을 담당하는 ViewModel
///
/// - MVVM 아키텍처 원칙에 따라 View는 이 ViewModel의 상태와 동작에만 의존함
/// - 내부 상태는 SignupModel로 캡슐화하여 응집력 있는 데이터 구조를 유지함
/// - View에서는 개별 프로퍼티(nickname, email, pwd)를 통해 상태에 바인딩 가능하도록 제공함
///   (내부 모델 구조는 숨기고 필요한 인터페이스만 노출함)
class SignupViewModel: ObservableObject {
    
    /// 회원가입 여부를 저장하는 앱 스토리지 (로컬 상태 저장 용도)
    @AppStorage("isSignedUp") private var isSignedUp: Bool = false
    
    // 서버 연결 시 필요 없음
    @AppStorage("nickname") private var nicknameStorage: String?
    @AppStorage("email") private var emailStorage: String?
    
    /// 사용자 입력을 저장하는 회원가입 모델(내부 모델)
    ///
    /// - ViewModel 내부에서만 접근할 수 있도록 캡슐화함
    /// - View에는 computed property를 통해 필요한 값만 노출함
    @Published private var signupModel: SignupModel = .init(
        nickname: "", email: "", pwd: ""
    )
    
    /// 닉네임 입력값 (뷰에서 바인딩할 수 있도록 연산 프로퍼티로 제공)
    var nickname: String {
        get { self.signupModel.nickname }
        set { self.signupModel.nickname = newValue }
    }
    
    /// 이메일 입력값
    var email: String {
        get { signupModel.email }
        set { signupModel.email = newValue }
    }
    
    /// 비밀번호 입력값
    var pwd: String {
        get { signupModel.pwd }
        set { signupModel.pwd = newValue }
    }
    
    /// 회원가입 처리 함수
    ///
    /// - 현재 상태에 저장된 사용자 정보를 기반으로 가입 처리 수행
    /// - 서버와의 통신이 없는 로컬 저장소 기반 로직 (향후 네트워크 연동 시 확장 가능)
    /// - 내부 상태인 signupModel을 외부에 노출하지 않고 처리
    func createUser() {
        let model = signupModel
        
        isSignedUp = true
        nicknameStorage = model.nickname
        emailStorage = model.email
        
        print(signupModel)
    }
}

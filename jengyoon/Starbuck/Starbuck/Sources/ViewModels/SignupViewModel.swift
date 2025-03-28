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
    /// - inout : 기존 함수 인자 값 복사 방식에서 "참조"를 넘겨 수정 가능하게끔 한다. 즉, 메모리 주소를 받아와 수정
    func saveClient (nicknameStorage: inout String,
                             emailStorage: inout String,
                             passwordStorage: inout String) {
        nicknameStorage = nickname
        emailStorage = email
        passwordStorage = password
    }
}

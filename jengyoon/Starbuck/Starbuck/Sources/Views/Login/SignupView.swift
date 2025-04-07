//
//  SignupView.swift
//  Starbuck
//
//  Created by 송승윤 on 3/27/25.
//

import SwiftUI

struct SignupView: View {
    // MARK: - Properties
    /// 해당 뷰에서 객체를 생성하여 관리하므로 @StateObject로 선언
    @StateObject private var viewModel = SignupViewModel()
    /// dismiss 사용하여 하위뷰 pop
    @Environment(\.dismiss) private var dismiss
    /// 입력필드 실시간으로 바인딩하기 위해 State로 선언하고 버튼 활성화
    @State private var inputNickname = ""
    @State private var inputEmail = ""
    @State private var inputPassword = ""
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack (alignment: .leading) {
                CustomNavigationBar(title: "가입하기") {
                    dismiss()
                }
                
                Spacer()
                
                TextField("닉네임", text: $inputNickname)
                
                Divider()
                
                Spacer().frame(height: 49)
                
                TextField("이메일", text: $inputEmail)
                
                Divider()
                
                Spacer().frame(height: 49)
                
                SecureField("비밀번호", text: $inputPassword)
                
                Divider()
                
                Spacer()
                
                createButton
                
                
            }
            .safeAreaPadding(.horizontal,20)
            .safeAreaPadding(.vertical, 20)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    // MARK: - Components
    private var createButton: some View {
        Button (action: {
            // 유효성 통과시에 AppStorage에 저장되도록
            // 모든 항목이 유효할 때만 실행되도록
            if buttonValid {
                viewModel.nickname = inputNickname
                viewModel.email = inputEmail
                viewModel.password = inputPassword
                dismiss()
            }
        }) {
            Text("생성하기")
                .font(.PretendardRegular18)
                .foregroundStyle(Color.white)
                .frame(maxWidth: 400, minHeight: 50)
                .background(buttonValid ? Color.primaryGreen : Color.gray.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .disabled(
            !buttonValid
        )
    }
    
    /// 버튼 활성화 비활성화 상태 체크
    /// - 세 항목이 모두 1글자 이상 채워져있어야 버튼이 활성화 되도록 유효성 검사
    private var buttonValid: Bool {
        !inputNickname.isEmpty &&
        !inputEmail.isEmpty &&
        !inputPassword.isEmpty
    }
}

#Preview {
    SignupView()
}

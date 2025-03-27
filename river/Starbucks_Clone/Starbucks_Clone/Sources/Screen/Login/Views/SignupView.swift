//
//  SignupView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/27/25.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject private var signupViewModel: SignupViewModel = SignupViewModel()
    
    @State private var signupModel: SignupModel = .init(
        nickname: "",
        email: "",
        pwd: ""
    )
    
    var body: some View {
        VStack {
            Spacer().frame(height: 172)
            
            VStack(alignment: .leading) {
                
                nicknameTextField
                
                Spacer().frame(height: 49)
                
                emailTextField
                
                Spacer().frame(height: 49)
                
                passwordTextField
                
                Spacer()
                
                SignupButtonView(
                    signupViewModel: signupViewModel,
                    signupModel: $signupModel
                )

            }
            .padding(.horizontal, 19)
            
            Spacer().frame(height: 72)
        }
    }
    
    // REFACT: 함수화 하면 더 좋을듯
    private var nicknameTextField: some View {
        Group {
            TextField("닉네임", text: $signupModel.nickname)
                .textFieldStyle(PlainTextFieldStyle())
                .font(.mainTextRegular13)
                .foregroundStyle(Color(.black01))
            
            Divider()
                .foregroundStyle(Color(.gray00))
        }
    }
    
    private var emailTextField: some View {
        Group {
            TextField("이메일", text: $signupModel.email)
                .textFieldStyle(PlainTextFieldStyle())
                .font(.mainTextRegular13)
                .foregroundStyle(Color(.black01))
            
            Divider()
                .foregroundStyle(Color(.gray00))
        }
    }
    
    private var passwordTextField: some View {
        Group {
            SecureField("비밀번호", text: $signupModel.pwd)
                .textFieldStyle(PlainTextFieldStyle())
                .font(.mainTextRegular13)
                .foregroundStyle(Color(.black01))
            
            Divider()
                .foregroundStyle(Color(.gray00))
        }
    }
}

// REFACT: - 로그인 버튼 뷰와 함께 컴토넌트와 필요
struct SignupButtonView: View {
    
    private let signupViewModel: SignupViewModel
    @Binding private var signupModel: SignupModel
    
    init(
        signupViewModel: SignupViewModel,
        signupModel: Binding<SignupModel>
    ) {
        self.signupViewModel = signupViewModel
        self._signupModel = signupModel
    }
    
    var body: some View {
        Button {
            signupViewModel.createUser(with: signupModel)
        } label: {
            Text("생성하기")
                .font(.mainTextMedium16)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 46)
        }
        .background(Color(.green01))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    SignupView()
}

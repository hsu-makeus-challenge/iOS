//
//  SignupView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/27/25.
//

import SwiftUI

struct SignupView: View {
    
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
                
                SignupButtonView()

            }
            .padding(.horizontal, 19)
            
            Spacer().frame(height: 72)
        }
    }
    
    private var nicknameTextField: some View {
        Group {
            TextField("닉네임", text: .constant(""))
                .textFieldStyle(PlainTextFieldStyle())
                .font(.mainTextRegular13)
                .foregroundStyle(Color(.black01))
            
            Divider()
                .foregroundStyle(Color(.gray00))
        }
    }
    
    private var emailTextField: some View {
        Group {
            TextField("이메일", text: .constant(""))
                .textFieldStyle(PlainTextFieldStyle())
                .font(.mainTextRegular13)
                .foregroundStyle(Color(.black01))
            
            Divider()
                .foregroundStyle(Color(.gray00))
        }
    }
    
    private var passwordTextField: some View {
        Group {
            SecureField("비밀번호", text: .constant(""))
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
    
    var body: some View {
        Button {
            print("생성하기")
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

//
//  SignupView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct SignupView: View {
    @State var viewModel = SignupViewModel()
    @FocusState private var isNicknameFocused: Bool
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    
    var body: some View {
        VStack {
            Frame3
            Spacer()
            ButtonView
        }
        .padding(.horizontal, 19)
        .padding(.top, 210)
        .padding(.bottom, 72)
    }
    
    private var Frame3: some View {
        VStack(spacing: 49) {
            VStack(spacing: 9) {
                TextField("닉네임", text: $viewModel.user.nickname)
                    .focused($isNicknameFocused)
                    .underline(isNicknameFocused, pattern: .solid, color: .green01)
                    .font(.mainTextRegular18)

                Divider()
                    .foregroundStyle(Color.gray00)
            }
            .frame(width: 402, height: 30)
            
            VStack(spacing: 9) {
                TextField("이메일", text: $viewModel.user.email)
                    .focused($isEmailFocused)
                    .underline(isEmailFocused, pattern: .solid, color: .green01)
                    .font(.mainTextRegular18)

                Divider()
                    .foregroundStyle(Color.gray00)
            }
            .frame(width: 402, height: 30)
            
            VStack(spacing: 9) {
                TextField("비밀번호", text: $viewModel.user.password)
                    .focused($isPasswordFocused)
                    .underline(isPasswordFocused, pattern: .solid, color: .green01)
                    .font(.mainTextRegular18)

                Divider()
                    .foregroundStyle(Color.gray00)
            }
            .frame(width: 402, height: 30)
        }
        .frame(height: 188)
    }
    
    private var ButtonView: some View {
        Button(action: {
            viewModel.saveUser()
        }, label: {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 58)
                .foregroundStyle(.green01)
                .overlay(content: {
                    Text("생성하기")
                        .font(.makeMedium18)
                        .foregroundStyle(.white01)
                })
        })
    }
}

#Preview {
    SignupView()
}

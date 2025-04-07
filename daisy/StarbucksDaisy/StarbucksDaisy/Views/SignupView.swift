//
//  SignupView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct SignupView: View {
    @StateObject var viewModel = SignupViewModel()
    @EnvironmentObject var router: NavigationRouter

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
        .navigationTitle("가입하기")
        .navigationBarTitleDisplayMode(.inline)     // 상단중앙에 타이틀 위치하도록 함
        .navigationBarBackButtonHidden(true)        // 기본 백버튼 숨김
        .toolbar {                                  // ToolbarItem으로 백버튼 커스텀(?)
            ToolbarItem(placement: .topBarLeading,
                        content: { BackButton })
        }
    }
    
    private var Frame3: some View {
        VStack(spacing: 49) {
            /// 닉네임 텍스트필드
            VStack(spacing: 9) {
                TextField("닉네임", text: $viewModel.user.nickname)
                    .focused($isNicknameFocused)
                    .font(.mainTextRegular18)

                Divider()
                    .background(isNicknameFocused ? Color.green01 : Color.gray00)
            }
            .frame(width: 402, height: 30)
            
            /// 이메일 텍스트필드
            VStack(spacing: 9) {
                TextField("이메일", text: $viewModel.user.email)
                    .focused($isEmailFocused)
                    .font(.mainTextRegular18)

                Divider()
                    .background(isEmailFocused ? Color.green01 : Color.gray00)
            }
            .frame(width: 402, height: 30)
            
            /// 비밀번호 텍스트필드
            VStack(spacing: 9) {
                TextField("비밀번호", text: $viewModel.user.pwd)
                    .focused($isPasswordFocused)
                    .font(.mainTextRegular18)

                Divider()
                    .background(isPasswordFocused ? Color.green01 :  Color.gray00)
            }
            .frame(width: 402, height: 30)
        }
        .frame(height: 188)
    }
    
    /// 생성하기 버튼
    private var ButtonView: some View {
        Button(action: {
            if viewModel.isSignupEnabled {
                viewModel.saveUser(router: router)
            }
//            router.pop()
        }, label: {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 58)
                .foregroundStyle(viewModel.isSignupEnabled ? .green01 : .gray00)
                .overlay(content: {
                    Text("생성하기")
                        .font(.makeMedium18)
                        .foregroundStyle(.white01)
                })
        })
        .disabled(!viewModel.isSignupEnabled)
    }
    
    private var BackButton: some View {
        Button(action: {
            router.pop()
        }, label: {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.black)
        })
    }
}

//#Preview {
//    SignupView( router: <#NavigationRouter#>)
//}

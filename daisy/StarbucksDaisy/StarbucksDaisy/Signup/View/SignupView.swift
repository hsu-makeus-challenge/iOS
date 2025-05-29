//
//  SignupView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var router: NavigationRouter
    @Environment(LoginViewModel.self) var loginViewModel
    
    @State private var id = ""
    @State private var pw = ""
    @State private var nickname = ""

    @FocusState private var isNicknameFocused: Bool
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    
    var isFormValid: Bool {
        !id.isEmpty && !pw.isEmpty && !nickname.isEmpty
    }
    
    var body: some View {
        VStack {
            TextFields
            Spacer()
            ButtonView
        }
        .ignoresSafeArea(edges: .bottom)
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
    
    private var TextFields: some View {
        VStack(spacing: 49) {
            /// 닉네임 텍스트필드
            VStack(spacing: 9) {
                TextField("닉네임", text: $nickname)
                    .focused($isNicknameFocused)
                    .font(.mainTextRegular18)

                Divider()
                    .background(isNicknameFocused ? Color.green01 : Color.gray00)
            }
            .frame(height: 30)
            
            /// 이메일 텍스트필드
            VStack(spacing: 9) {
                TextField("이메일", text: $id)
                    .focused($isEmailFocused)
                    .font(.mainTextRegular18)

                Divider()
                    .background(isEmailFocused ? Color.green01 : Color.gray00)
            }
            .frame(height: 30)
            
            /// 비밀번호 텍스트필드
            VStack(spacing: 9) {
                TextField("비밀번호", text: $pw)
                    .focused($isPasswordFocused)
                    .font(.mainTextRegular18)

                Divider()
                    .background(isPasswordFocused ? Color.green01 :  Color.gray00)
            }
            .frame(height: 30)
        }
        .frame(height: 188)
        .frame(maxWidth: .infinity)
    }
    
    /// 생성하기 버튼
    private var ButtonView: some View {
        Button(action: {
            if isFormValid {
                
                KeychainService.shared.save(key: "user_nickname", value: nickname)
                KeychainService.shared.save(key: "user_id", value: id)
                KeychainService.shared.save(key: "user_pw", value: pw)
                
                loginViewModel.nickname = nickname
                loginViewModel.isLoggedIn = true
                router.reset()
                print("사용자 회원가입 및 유저 정보 저장 완료")
                
            }
        }, label: {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 58)
                .foregroundStyle(isFormValid ? .green01 : .gray00)
                .overlay(content: {
                    Text("생성하기")
                        .font(.makeMedium18)
                        .foregroundStyle(.white01)
                })
        })
        .disabled(!isFormValid)
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


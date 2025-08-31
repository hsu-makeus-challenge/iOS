//
//  LoginView.swift
//  Starbuck
//
//  Created by 송승윤 on 3/20/25.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    
    /// FocusField 변수 선언
    private enum Field: Hashable {
        case id
        case password
    }
    
    @EnvironmentObject private var router: NavigationRouter
    @FocusState private var focusField: Field?
    @StateObject private var viewModel = LoginViewModel()
    @StateObject private var kakaoVM = KakaoLoginViewModel()
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 104) {
                loginTitleGroup
                appLogin
                socialLogin
            }
            .padding(.horizontal, 20)
        }
        .onChange(of: viewModel.isLogin) {
            router.isLoggedIn = true
        }
    }
    
    // MARK: - Components
    // 로그인 타이틀
    private var loginTitleGroup: some View {
        VStack (alignment: .leading) {
            Image(.starbuck)
                .resizable()
                .scaledToFit()
                .frame(width: 97, height: 95)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
            
            
            Text("안녕하세요\n스타벅스입니다.")
                .font(.system(size: 24, weight: .black, design: .default))
                .fixedSize(horizontal: false, vertical: true) // ✅ 자동 크기 조정
                .multilineTextAlignment(.leading)
                .padding(.bottom, 19)
                
            Text("회원 서비스 이용을 위해 로그인 해주세요")
                .font(.PretendardMedium16)
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity) // 너비 균형 유지
    }
    
    // 앱 로그인
    private var appLogin: some View {
        VStack (alignment: .leading) {
            TextField("아이디를 입력하세요", text: $viewModel.inputEmail)
                .font(.PretendardLight14)
                .foregroundStyle(.gray)
                .focused($focusField, equals: .id)
                .onSubmit {
                    focusField = .password
                }
            
            Divider()
                .background(focusField == .id ? Color.primaryGreen : Color.gray)
            
            Spacer().frame(height: 49)
            
            SecureField("비밀번호를 입력하세요", text: $viewModel.inputPassword)
                .font(.PretendardLight14)
                .foregroundStyle(.gray)
                .focused($focusField, equals: .password)
            
            Divider()
                .background(focusField == .password ? Color.primaryGreen : Color.gray)
            
            Spacer().frame(height: 49)
            
            Button(action: {
                viewModel.login()
            }) {
                Text("로그인하기")
                    .font(.PretendardMedium16)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(viewModel.buttonValid ? Color.primaryGreen : Color.gray.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .disabled(!viewModel.buttonValid)
            
            if let error = viewModel.loginError {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
    
    // 소셜 로그인(로그인하기 버튼)
    private var socialLogin: some View {
        VStack (alignment: .center, spacing: 19) {
            
            Text("이메일로 회원가입하기")
                .font(.PretendardLight14)
                .foregroundStyle(.gray)
                .underline()
                .onTapGesture {
                    router.navigate(to: .signup)
                }
            
            SocialLoginButton(buttonColor: Color.yellow, textColor: Color.black, text: "카카오 로그인", font: .PretendardMedium16, icon: "kakao", action: {
                // 카카오 버튼을 누르면 LoginViewModel과 연결하여 로그인 절차 진행
                kakaoVM.loginViewModel = viewModel
                kakaoVM.loginWithKakao()
            })
            
            
            SocialLoginButton(buttonColor: Color.black, textColor: Color.white, text: "Apple로 로그인", font: .PretendardMedium16, icon: "apple", action: {})
        }
    }
}

#Preview {
    LoginView()
}

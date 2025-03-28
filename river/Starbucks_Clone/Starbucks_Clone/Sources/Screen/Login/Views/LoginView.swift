//
//  LoginView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/20/25.
//

import SwiftUI

enum PREVIEW_DEVICE_TYPE : String, CaseIterable {
    case iPhone_11 = "iPhone 11"
    case iPhone_15_Pro = "iPhone 16 Pro"
}

struct LoginView: View {
    
    @Bindable private var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            WelcomeMessageView()
            
            Spacer().frame(height: 104)
            
            LoginFormView(loginViewModel: loginViewModel)
            
            Spacer().frame(height: 47)
            
            LoginButtonView(loginViewModel: loginViewModel)
            
            Spacer().frame(height: 104)
            
            emailLoginTextView()
            
            Spacer().frame(height: 19)
            
            SocialLoginButtonView()
        }
        .padding(.horizontal, 19)
    }
}

struct WelcomeMessageView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(.starbuckLogo)
                .resizable()
                .frame(width: 97, height: 95)
            
            Spacer().frame(height: 28)
            
            Text("안녕하세요.\n스타벅스입니다.")
                .font(.mainTextExtraBold24)
                .foregroundStyle(.black)
            
            Spacer().frame(height: 19)
            
            Text("회원 서비스 이용을 위해 로그인 해주세요")
                .font(.mainTextMedium16)
                .foregroundStyle(Color(.gray01))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

enum FocusField {
    case id
    case password
}

struct LoginFormView: View {
    
    @Bindable private var loginViewModel: LoginViewModel
    @FocusState private var focusField: FocusField?
    
    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("아이디")
                    .font(.mainTextRegular13)
                    .foregroundStyle(Color(.black01))
                
                TextField("", text: $loginViewModel.id)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.mainTextRegular13)
                    .foregroundStyle(Color(.black01))
                    .focused($focusField, equals: .id)
            }
            
            Divider()
                .background(focusField == .id ? Color(.green01) : Color(.gray02))
            
            Spacer().frame(height: 47)
            
            HStack {
                Text("비밀번호")
                    .font(.mainTextRegular13)
                    .foregroundStyle(Color(.black01))
                
                SecureField("", text: $loginViewModel.pwd)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.mainTextRegular13)
                    .foregroundStyle(Color(.black01))
                    .focused($focusField, equals: .password)
            }
            
            Divider()
                .background(focusField == .password ? Color(.green01) : Color(.gray02))
        }
    }
}

struct LoginButtonView: View {
    
    @Bindable private var loginViewModel: LoginViewModel
    
    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
    }
    
    var body: some View {
        Button {
            loginViewModel.login()
        } label: {
            Text("로그인하기")
                .font(.mainTextMedium16)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 46)
        }
        .background(loginViewModel.isLoginEnabled
                    ? Color(.green01)
                    : Color(.green01).opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct emailLoginTextView: View {
    var body: some View {
        Text("이메일로 회원가입하기")
            .font(.mainTextRegular12)
            .underline()
            .foregroundStyle(Color(.gray04))
    }
}

struct SocialLoginButtonView: View {
    var body: some View {
        VStack {
            kakaoLoginButtonView
            
            Spacer().frame(height: 19)
            
            appleLoginButtonView
        }
    }
    
    private var kakaoLoginButtonView: some View {
        Button {
            print("Kakao Login")
        } label: {
            HStack {
                Image(.kakaoLogo)
                
                Spacer()
                
                Text("카카오 로그인")
                    .font(.mainTextMedium16)
                    .foregroundStyle(Color(.kakaoText))
                
                Spacer()
            }
            .padding(.horizontal, 14)
        }
        .frame(width: 306 ,height: 45)
        .background(Color(.kakaoBg))
    }
    
    private var appleLoginButtonView: some View {
        Button {
            print("Apple Login")
        } label: {
            HStack {
                Image(.appleLogo)
                
                Spacer()
                
                Text("애플 로그인")
                    .font(.mainTextMedium16)
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding(.horizontal, 14)
        }
        .frame(width: 306 ,height: 45)
        .background(.black)
    }
}

struct SwiftUIView_Preview: PreviewProvider {
    static var previews : some View {
        ForEach(
            PREVIEW_DEVICE_TYPE.allCases,
            id: \.self
        ) { deviceType in
            LoginView()
                .previewDevice(
                    PreviewDevice(rawValue: deviceType.rawValue))
                .previewDisplayName(deviceType.rawValue)
            
        }
    }
}

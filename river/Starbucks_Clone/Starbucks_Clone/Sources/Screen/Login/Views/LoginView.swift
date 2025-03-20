//
//  LoginView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/20/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            WelcomeMessageView()
            
            Spacer().frame(height: 104)
            
            LoginFormView()
            
            Spacer().frame(height: 47)
            
            LoginButtonView()
            
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

struct LoginFormView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("아이디")
                    .font(.mainTextRegular13)
                    .foregroundStyle(Color(.black01))
                
                TextField("", text: .constant(""))
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.mainTextRegular13)
                    .foregroundStyle(Color(.black01))
            }
            
            Divider()
                .foregroundStyle(Color(.gray00))
            
            Spacer().frame(height: 47)
            
            HStack {
                Text("비밀번호")
                    .font(.mainTextRegular13)
                    .foregroundStyle(Color(.black01))
                
                SecureField("", text: .constant(""))
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.mainTextRegular13)
                    .foregroundStyle(Color(.black01))
            }
            
            Divider()
                .foregroundStyle(Color(.gray00))
        }
    }
}

struct LoginButtonView: View {
    var body: some View {
        Button {
            print("로그인하기")
        } label: {
            Text("로그인하기")
                .font(.mainTextMedium16)
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 46)
        .background(Color(.green01))
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

#Preview {
    LoginView()
}

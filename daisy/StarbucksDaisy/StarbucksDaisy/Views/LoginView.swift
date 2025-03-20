//
//  LoginView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/20/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack{
            Spacer().frame(height: 104)
            VStack() {
                loginTitle
                Spacer()
                loginMiddle
                Spacer()
                loginBottom
            }
            .frame(height: 751)
        }
    }
    
    private var loginTitle: some View {
        VStack(alignment: .leading) {
            Image("starbucksLogo")
                .resizable()
                .frame(width: 97, height: 95)
            
            Spacer().frame(height: 28)
            VStack(alignment: .leading) {
                Text("안녕하세요.\n스타벅스입니다.")
                    .font(.mainTextExtraBold24)
                    .kerning(2)
                Spacer().frame(height: 19)
                Text("회원 서비스 이용을 위해 로그인 해주세요")
                    .font(.mainTextMedium16)
                    .foregroundStyle(Color.gray01)
            }
            .frame(width: 402, height: 96, alignment: .topLeading)
        }
    }
    
    private var loginMiddle: some View {
        VStack(spacing: 47) {
            VStack(alignment: .leading) {
                Text("아이디")
                    .font(.mainTextRegular13)
                    .foregroundStyle(Color.black01)
                Divider()
                    .foregroundStyle(Color.gray00)
            }
            .frame(width: 401, height: 20)
            
            VStack(alignment: .leading) {
                Text("비밀번호")
                    .font(.mainTextRegular13)
                    .foregroundStyle(Color.black01)
                Divider()
                    .foregroundStyle(Color.gray00)
            }
            .frame(width: 401, height: 20)

            RoundedRectangle(cornerRadius: 20)
                .frame(width: 402, height: 46)
                .foregroundStyle(Color.green01)
                .overlay {
                    Text("로그인하기")
                        .font(.mainTextMedium16)
                        .foregroundStyle(Color.white)
                }
        }
    }
    
    private var loginBottom: some View {
        VStack(spacing: 19) {
            Text("이메일로 회원가입하기")
                .font(.mainTextRegular12)
                .foregroundStyle(Color.gray04)
                .underline()
            Image("kakaoLogin")
            Image("appleLogin")
        }
        .frame(height: 144)
    }
}

#Preview {
    LoginView()
}

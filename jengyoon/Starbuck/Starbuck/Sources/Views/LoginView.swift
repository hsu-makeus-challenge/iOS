//
//  LoginView.swift
//  Starbuck
//
//  Created by 송승윤 on 3/20/25.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 104) {
                
                loginTitleGroup
                appLogin
                socialLogin
            } // 전체 VStack
            .padding(.horizontal, 20)
            .padding(.top, 100)
        } // 전체 ZStack
    }
    
    
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
            Text("아이디")
                .font(.PretendardLight14)
                .foregroundStyle(.gray)
            
            Divider()
            
            Spacer().frame(height: 49)
            
            Text("비밀번호")
                .font(.PretendardLight14)
                .foregroundStyle(.gray)
            
            Divider()
            
            Spacer().frame(height: 49)
            
            Button(action: {
                print("버튼이 눌렸습니다.")
            }) {
                Text("로그인하기")
                    .font(.PretendardMedium16)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.primaryGreen)
                    .cornerRadius(35)
            }
        }
    }
    
    // 소셜 로그인(로그인하기 버튼)
    private var socialLogin: some View {
        VStack (alignment: .center, spacing: 19) {
            
            Text("이메일로 회원가입하기")
                .font(.PretendardLight14)
                .foregroundStyle(.gray)
                .underline()
            
            SocialLoginButton(buttonColor: .yellow, textColor: .black, text: "카카오 로그인", font: .PretendardMedium16, icon: "kakao", action: {})
            
            
            SocialLoginButton(buttonColor: .black, textColor: .white, text: "Apple로 로그인", font: .PretendardMedium16, icon: "apple", action: {})
        }
    }
}
#Preview {
    LoginView()
}

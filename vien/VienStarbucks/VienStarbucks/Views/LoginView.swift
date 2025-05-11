import SwiftUI


struct LoginView: View {
    @StateObject var loginViewModel: LoginViewModel = .init()
    
    var body: some View {
        NavigationStack{
        
            VStack {
                
                WelcomeView()
                
                Spacer().frame(height: 104)

                IdPwdView(loginViewModel: loginViewModel)
                
                Spacer().frame(height: 47)
                
                LoginButtonView(loginViewModel: loginViewModel)
                
                Spacer().frame(height: 104)
                
                SignUpView()
            }
            .padding(.horizontal, 19)
        }
    }
}

struct WelcomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(.starbucksLogo)
                .resizable()
                .frame(width: 97, height: 95)
            
            Spacer().frame(height: 28)

            Text("안녕하세요.\n스타벅스입니다.")
                .foregroundColor(.black)
                .font(.mainTextBold24)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer().frame(height: 19)

            Text("회원 서비스 이용을 위해 로그인 해주세요")
                .foregroundColor(Color("gray01"))
                .font(.mainTextMedium16)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct IdPwdView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("아이디", text: $loginViewModel.id)
                .font(.mainTextRegular13)
                .textFieldStyle(.plain)
                .focused($isFocused)
                .foregroundStyle(Color(.black01))
            
            Divider()
                .background(isFocused ? Color("green01") : Color("gray00"))
            
            Spacer().frame(height: 47)
            
            SecureField("비밀번호", text: $loginViewModel.pwd)
                .font(.mainTextRegular13)
                .textFieldStyle(.plain)
                .focused($isFocused)
                .foregroundStyle(Color(.black01))
            
            Divider()
                .background(isFocused ? Color("green01") : Color("gray00"))
        }
    }
}

struct LoginButtonView: View {
    @ObservedObject var loginViewModel: LoginViewModel

    var body: some View {
        Button(action: {
            print("ID: \(loginViewModel.id)")
            print("PWD: \(loginViewModel.pwd)")
        }) {
            Text("로그인하기")
                .font(.mainTextMedium16)
                .frame(maxWidth: .infinity)
                .frame(height: 46)
                .foregroundColor(.white01)
                .background(Color.green01)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct KakaoLoginButton: View {
    var body: some View {
        Button {
            let clientID = "당신의 REST API 키"
            let redirectURI = "myapp://oauth"
            
            let urlString = "https://kauth.kakao.com/oauth/authorize?client_id=\(clientID)&redirect_uri=\(redirectURI)&response_type=code"
            
            
            print("👉 URL: \(urlString)") // ✅ 찍어보자

            
            if let url = URL(string: urlString) {
                UIApplication.shared.open(url)
            }
        } label: {
            HStack {
                Image(systemName: "message.fill")
                Spacer()
                Text("카카오 로그인")
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding()
        }
        .frame(height: 50)
        .background(Color.yellow)
        .cornerRadius(10)
        .padding(.horizontal, 40)
    }
}


struct SignUpView: View {
    var body: some View {
        VStack {
            emailLoginView

            Spacer().frame(height: 19)

            kakaoLoginBtnView

            Spacer().frame(height: 19)

            appleLoginBtnView
        }
    }

//    private var emailLoginView: some View {
//        VStack {
//            Text("이메일로 회원가입하기")
//                .underline()
//                .font(.mainTextRegular12)
//                .foregroundColor(Color("gray03"))
//        }
//    }
    private var emailLoginView: some View {
        NavigationLink(destination: SignupView()) {
            Text("이메일로 회원가입하기")
                .underline()
                .font(.mainTextRegular12)
                .foregroundColor(Color("gray03"))
        }
    }
    
    
    private var kakaoLoginBtnView: some View {
        Button {
            print("카카오 로그인")
        } label: {
            HStack {
                Image(.kakaoLogo)
                Spacer()
                Text("카카오 로그인")
                    .font(.mainTextMedium16)
                    .foregroundStyle(.black)
                Spacer()
            }
            .padding(.horizontal, 14)
        }
        .frame(height: 45)
        .background(Color.kakaobg)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .padding(.horizontal, 48)
    }

    private var appleLoginBtnView: some View {
        Button {
            print("애플 로그인")
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
        .frame(height: 45)
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .padding(.horizontal, 48)
    }
}

#Preview {
    LoginView()
}

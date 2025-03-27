import SwiftUI

struct LoginView: View {
    var body: some View {
        
        @StateObject var loginViewModel: LoginViewModel = .init()

        
        
        GeometryReader { geometry in
            let screenHeight = geometry.size.height //geometry.size.height를 통해 현재 기기 화면 높이를 알 수 있게 해줌.
            
            VStack {
                Spacer().frame(height: screenHeight * 0.09) // 기기높이의 9% 만큼 빈 공간을 준다 (104)
                
                WelcomeView(geometry: geometry)
                
                Spacer().frame(height: screenHeight * 0.09)  //104
                
//                IdPwdView(geometry: geometry)
                IdPwdView(geometry: geometry, loginViewModel: loginViewModel)
                
                Spacer().frame(height: screenHeight * 0.04)   // 47
                
                LoginButtonView()
                
                Spacer().frame(height: screenHeight * 0.09)   // 104
                
                SignUpView(geometry: geometry)
            }
            .padding(.horizontal, 19)
        }
    }
}
    
struct WelcomeView: View {
    var geometry: GeometryProxy
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(.starbucksLogo)
                .resizable()
                .frame(width: geometry.size.width * 0.27, height: geometry.size.width * 0.26) // 비율 조절
            
            Spacer().frame(height: geometry.size.height * 0.03)
            
            Text("안녕하세요.\n스타벅스입니다.")
                .foregroundColor(.black)
                .font(.mainTextBold24)
                .fixedSize(horizontal: false, vertical: true) // 자동 크기 조정
            
            Spacer().frame(height: geometry.size.height * 0.02)
            
            Text("회원 서비스 이용을 위해 로그인 해주세요")
                .foregroundColor(Color("gray01"))
                .font(.mainTextMedium16)
        }
        .frame(maxWidth: .infinity, alignment: .leading) // 왼쪽 정렬 위해
    }
}


struct IdPwdView: View {
    var geometry: GeometryProxy
    @ObservedObject var loginViewModel: LoginViewModel
    
    @FocusState private var isIdFocused: Bool
    @FocusState private var isPwdFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {

            TextField("아이디", text: $loginViewModel.id)
                .textFieldStyle(.plain)
                .focused($isIdFocused)
            
            
            Divider()
                .background(isIdFocused ? Color("green01") : Color("gray00"))
                
            Spacer().frame(height: geometry.size.height * 0.06)
                
            
            SecureField("비밀번호", text: $loginViewModel.pwd)
                .textFieldStyle(.plain)
                .focused($isPwdFocused)
            
            Divider()
                .background(isPwdFocused ? Color("green01") : Color("gray00"))
        }
    }
}


struct LoginButtonView: View {
    var body: some View {
        
        Button(action: {
            print("로그인하기")
        }){
            Text("로그인하기")
                .font(.mainTextMedium16)
                .frame(maxWidth: .infinity)
                .frame(height: 58)
                .foregroundColor(.white01)
                .background(Color.green01)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}


struct SignUpView: View {
    var geometry: GeometryProxy
    
    var body: some View {
        Text("이메일로 회원가입하기")
            .underline()
            .font(.mainTextRegular13)
            .foregroundColor(Color("gray03"))
        
        Spacer().frame(height: geometry.size.height * 0.02)
        
        
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
        
        
        Spacer().frame(height: geometry.size.height * 0.02)
    

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


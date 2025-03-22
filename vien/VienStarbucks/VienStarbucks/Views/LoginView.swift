import SwiftUI

// 아 이렇게 묶으면 전체 패딩을 한번에 줄수 잇구나.. 또 배운다
// 그리고 이렇게 나눌시에 다루기도 편하고 그런듯
//struct LoginView: View {
//    var body: some View {
//        VStack {
//            WelcomeView()
//            
//            Spacer().frame(height: 104)
//            
//            IdPwdView()
//
//            Spacer().frame(height:47)
//
//            LoginButtonView()
//            
//            Spacer().frame(height:104)
//            
//            SignUpView()
//            
//        }
//        .padding(.horizontal, 19)
//    }
//}
struct LoginView: View {
    var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height //geometry.size.height를 통해 현재 기기 화면 높이를 알 수 있게 해줌.
            
            VStack {
                Spacer().frame(height: screenHeight * 0.09) // 기기높이의 9% 만큼 빈 공간을 준다 (104)
                
                WelcomeView(geometry: geometry)
                
                Spacer().frame(height: screenHeight * 0.09)  //104
                
                IdPwdView(geometry: geometry)
                
                Spacer().frame(height: screenHeight * 0.04)   // 47
                
                LoginButtonView()
                
                Spacer().frame(height: screenHeight * 0.09)   // 104
                
                SignUpView(geometry: geometry)
            }
            .padding(.horizontal, 19)
        }
    }
}
    
//
//struct WelcomeView: View {
//    var body: some View {
//        VStack(alignment: .leading) {
//            Image(.starbucksLogo)
//                .resizable()
//                .frame(width: 97, height: 95)
//            
//            Spacer().frame(height: 28)
//            
//            Text("안녕하세요.\n스타벅스입니다.")
//                .foregroundColor(.black)
//                .font(.mainTextBold24)
//                .fixedSize(horizontal: false, vertical: true) // 자동 크기 조정
//            
//            Spacer().frame(height: 19)
//            
//            Text("회원 서비스 이용을 위해 로그인 해주세요")
//                .foregroundColor(Color("gray01"))
//                .font(.mainTextMedium16)
//        }
//        .frame(maxWidth: .infinity, alignment: .leading) // 왼쪽 정렬 위해
//    }
//}
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



//
//struct IdPwdView: View {
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("아이디")
//                .font(.mainTextRegular13)
//            Divider()
//                .background(Color("gray00"))
//                
//            Spacer().frame(height:47)
//                
//            Text("비밀번호")
//                .font(.mainTextRegular13)
//            
//            Divider()
//                .background(Color("gray00"))
//        }
//    }
//}
struct IdPwdView: View {
    var geometry: GeometryProxy
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("아이디")
                .font(.mainTextRegular13)
            Divider()
                .background(Color("gray00"))
                
            Spacer().frame(height: geometry.size.height * 0.06)
                
            Text("비밀번호")
                .font(.mainTextRegular13)
            Divider()
                .background(Color("gray00"))
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
                .frame(height: 46)
                .foregroundColor(.white00)
                .background(Color.green01)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}



//struct SignUpView: View {
//    var body: some View {
//        //Email SignUp
//        Text("이메일로 회원가입하기")
//            .underline()
//            .font(.mainTextRegular13)
//            .foregroundColor(Color("gray03"))
//        
//        Spacer().frame(height:19)
//     
//        //이미지불러오기보단 그냥 직접 버튼 만드는게 좋을 것 같다 하셧으니 만들어보기
//
//        Button {
//            print("카카오 로그인")
//        } label: {
//            HStack {
//                Image(.kakaoLogo)
//                Spacer()
//                Text("카카오 로그인")
//                    .font(.mainTextMedium16)
//                    .foregroundStyle(.black)
//                Spacer()
//            }
//            .padding(.horizontal, 14)
//        }
//        .frame(height: 45)
//        .background(Color.kakaobg)
//        .clipShape(RoundedRectangle(cornerRadius: 5))
//        .padding(.horizontal, 48)
//        
//        
//        Spacer().frame(height:19)
//    
//
//        Button {
//            print("Apple Login")
//        } label: {
//            HStack {
//                Image(.appleLogo)
//                Spacer()
//                Text("애플 로그인")
//                    .font(.mainTextMedium16)
//                    .foregroundStyle(.white)
//                Spacer()
//            }
//            .padding(.horizontal, 14)
//        }
//        .frame(height: 45)
//        .background(Color.black)
//        .clipShape(RoundedRectangle(cornerRadius: 5))
//        .padding(.horizontal, 48) // 아 버튼 가로길이를 고정할게 아니라 인피니티로 "양옆" 패딩 주면 크기 기종 바껴도 ㄱㅊ겠구나
//        
//      
//    }
//}
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



//스플래시 뷰.....

#Preview {
    LoginView()
}


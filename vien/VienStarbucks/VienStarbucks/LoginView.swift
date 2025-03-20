import SwiftUI

struct LoginView: View {
    var body: some View {
        
        
        VStack{
            VStack(alignment: .leading) {
                
                // 배경 화이트로 - 그럼 ZStack 해야겠네??
                // 워크북 보고 private var ㅇㅇㅇㅇ(뷰이름) : som view로 묶기 (각 스택뷰마다)
                // 동적 여백?? 어떻게??? 흠
                
                Spacer().frame(height: 142)
                
                Image(.starbucksLogo)
                    .resizable()
                    .frame(width: 97, height: 95)
                
                Spacer().frame(height: 28)
                
                
                Text("안녕하세요.\n스타벅스입니다.")
                    .foregroundColor(.black)
                //                .font(.customFont(.mainTextBold24)) //왜 안되는거?
                    .font(.custom("Pretendard-Bold", size: 24))
                    .fixedSize(horizontal: false, vertical: true) // 자동 크기 조정
                
                Spacer().frame(height: 19) //남의 코드 보니까 패딩 써도 될듯
                
                Text("회원 서비스 이용을 위해 로그인 해주세요")
                    .foregroundColor(Color("gray01"))
                //                .font(.customFont(.mainTextMedium16))
                    .font(.custom("Pretendard-Medium", size: 16))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 19)
            
            Spacer().frame(height: 104)
            
            
                VStack(alignment: .leading) {
                    Text("아이디")
                    //                .font(.customFont(.mainTextRegular13))
                        .font(.custom("Pretendard-Regular", size: 13))
                    Divider()
                        .background(Color("gray00"))
                    
                    Spacer().frame(height:47)
                    
                    Text("비밀번호")
                    //                .font(.customFont(.mainTextRegular13))
                        .font(.custom("Pretendard-Regular", size: 13))

                    Divider()
                        .background(Color("gray00"))
                }.padding(.horizontal, 19)
            
            Spacer().frame(height:47)
            
            VStack(){
                // 야 이거 이미지 아님;;;;
                Image("normalLogin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 46)
                
                Spacer().frame(height:104)
                
                Text("이메일로 회원가입하기")
                    .underline()
                //                .font(.custom(.mainTextRegular13))
                    .font(.custom("Pretendard-Regular", size: 13))
                    .foregroundColor(Color("gray03"))
                
                Spacer().frame(height:19)
                
                
                
                //흠
                Image("kakaoLogin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 45)
                
                Spacer().frame(height:19)
                
                Image("appleLogin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 45)
                
                Spacer().frame(height:62.95)
                
            }
            .padding(.horizontal, 19)
        }
    }
}

//스플래시 뷰.....


#Preview {
    LoginView()
}

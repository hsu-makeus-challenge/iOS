import SwiftUI

struct SignupView: View {
    @StateObject var SignupViewModel: SignupViewModel = .init()
    
    var body: some View {
        Spacer().frame(height: 21)
        
        SignupFormView(signupViewModel: SignupViewModel)
        
        Spacer().frame(height: 42)
        
        createBtnView(signupViewModel: SignupViewModel)
        
        Spacer().frame(height:72)
    }
}

struct SignupFormView: View {
    
    @ObservedObject var signupViewModel: SignupViewModel
    
    var body: some View {
        VStack(spacing:30) {
            
            Spacer().frame(height:210)
            
            TextField("닉네임", text: $signupViewModel.nickname)
                .textFieldStyle(.plain)
            Divider()
                .background(Color("gray00"))
            
            
            Spacer().frame(height: 49)
            
            TextField("이메일", text: $signupViewModel.email)
                .textFieldStyle(.plain)
            Divider()
                .background(Color("gray00"))
            
            Spacer().frame(height: 49)
            
            SecureField("비밀번호", text: $signupViewModel.password)
                .textFieldStyle(.plain)
            Divider()
                .background(Color("gray00"))
            
        }
    }
}

struct createBtnView: View {
    
    @ObservedObject var signupViewModel: SignupViewModel
    
    var body: some View {
        
        Button(action: {
            signupViewModel.saveUser() // ViewModel의 AppStorage 저장 함수 호출
        }){
            Text("생성하기")
//                .font(.mainTextMedium18)
                .font(.mainTextMedium16)
                .frame(maxWidth: .infinity)
                .frame(height: 58)
                .foregroundColor(.white01)
                .background(Color.green01)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        
        

    }
}

#Preview {
    SignupView()
}

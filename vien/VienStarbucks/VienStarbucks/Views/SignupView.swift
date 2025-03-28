import SwiftUI

struct SignupView: View {
    @StateObject var SignupViewModel: SignupViewModel = .init()
    
    var body: some View {
        VStack {
            
            Spacer().frame(height:210)
            
            SignupFormView(signupViewModel: SignupViewModel)
            
            Spacer().frame(height: 428)
            
            createBtnView(signupViewModel: SignupViewModel)
            
            Spacer().frame(height:72)
        }
        .padding(.horizontal, 19)
    }
}

struct SignupFormView: View {
    
    @ObservedObject var signupViewModel: SignupViewModel
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack() {
            
            TextField("닉네임", text: $signupViewModel.nickname)
                .font(.mainTextRegular18)
                .textFieldStyle(.plain)
                .focused($isFocused)
                .foregroundStyle(Color(.gray02))
                                 
            Divider()
                .background(isFocused ? Color(.green01) : Color(.gray00))
            
            
            Spacer().frame(height: 49)
            
            TextField("이메일", text: $signupViewModel.email)
                .font(.mainTextRegular18)
                .textFieldStyle(.plain)
                .focused($isFocused)
                .foregroundStyle(Color(.gray02))
            
            Divider()
                .background(isFocused ? Color(.green01) : Color(.gray00))
            
            Spacer().frame(height: 49)
            
            SecureField("비밀번호", text: $signupViewModel.password)
                .font(.mainTextRegular18)
                .textFieldStyle(.plain)
                .focused($isFocused)
                .foregroundStyle(Color(.gray02))
                
            
            Divider()
                .background(isFocused ? Color(.green01) : Color(.gray00))
            
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

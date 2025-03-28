//
//  SignupView.swift
//  Starbuck
//
//  Created by 송승윤 on 3/27/25.
//

import SwiftUI

struct SignupView: View {
    @AppStorage("nickname") private var nickname : String = ""
    @AppStorage("email") private var email : String = ""
    @AppStorage("password") private var password : String = ""
    @State private var viewModel = SignupViewModel()
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            Spacer().frame(height: 210)
            
            TextField("닉네임", text: $nickname)
            
            Divider()
            
            Spacer().frame(height: 49)
            
            TextField("이메일", text: $email)
            
            Divider()
            
            Spacer().frame(height: 49)
            
            SecureField("비밀번호", text: $password)
            
            Divider()
            
            Spacer().frame(height: 428)
            
            createButton
            
            Spacer().frame(height: 72)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
    
    private var createButton: some View {
        Button (action: {
            viewModel.saveClient(nicknameStorage: &nickname, emailStorage: &email, passwordStorage: &password)
        }) {
            Text("생성하기")
                .font(.PretendardRegular18)
                .foregroundStyle(Color.white)
                .frame(maxWidth: 400, minHeight: 50)
                .background(Color.primaryGreen)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

#Preview {
    SignupView()
}

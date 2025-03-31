//
//  SignupView.swift
//  Starbuck
//
//  Created by 송승윤 on 3/27/25.
//

import SwiftUI

struct SignupView: View {
    @State private var viewModel = SignupViewModel()
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            Spacer().frame(height: 210)
            
            TextField("닉네임", text: $viewModel.nickname)
            
            Divider()
            
            Spacer().frame(height: 49)
            
            TextField("이메일", text: $viewModel.email)
            
            Divider()
            
            Spacer().frame(height: 49)
            
            SecureField("비밀번호", text: $viewModel.password)
            
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
            // AppStorage에서 저장된 값 사용
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

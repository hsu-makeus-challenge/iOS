//
//  SignupView.swift
//  Starbuck
//
//  Created by 송승윤 on 3/27/25.
//

import SwiftUI

struct SignupView: View {
    // MARK: - Properties
    @State private var viewModel = SignupViewModel()
    /// dismiss 사용하여 하위뷰 pop
    @Environment(\.dismiss) private var dismiss
    
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
            
            Spacer().frame(height: 100)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
        .navigationTitle("스타벅스 회원가입")
        .navigationBarBackButtonHidden(true)
        
    }
    
    // MARK: - Components
    private var createButton: some View {
        Button (action: {
            // AppStorage에서 저장된 값 사용
            dismiss()
        }) {
            Text("생성하기")
                .font(.PretendardRegular18)
                .foregroundStyle(Color.white)
                .frame(maxWidth: 400, minHeight: 50)
                .background(Color.primaryGreen)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
    
    /// 뒤로가기 버튼 커스텀
    private var backButton: some View {
        Button(action: {
            dismiss()
        }, label: {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                foregroundStyle(Color.primaryGreen)
                Text("뒤로 가기")
            }
        })
    }
}

#Preview {
    SignupView()
}

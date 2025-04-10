//
//  SignupView.swift
//  Starbuck
//
//  Created by 송승윤 on 3/27/25.
//

import SwiftUI

struct SignupView: View {
    // MARK: - Properties
    @EnvironmentObject private var router: NavigationRouter
    @StateObject private var viewModel = SignupViewModel()
    @Environment(\.dismiss) private var dismiss
    @FocusState private var focusField: Field?
    
    private enum Field: Hashable {
        case nickname
        case email
        case password
    }
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 0) {
                CustomNavigationBar(title: "가입하기") {
                    dismiss()
                }
                
                Spacer()
                
                signupForm
                    .padding(.top, 20)
                
                Spacer()
                signupButton
                    .padding(.bottom, 20)
            }
            .padding(.horizontal, 20)
        }
        .navigationBarBackButtonHidden()
    }
    
    // MARK: - Components
    private var signupForm: some View {
        VStack(alignment: .leading, spacing: 0) {
            TextField("닉네임", text: $viewModel.nickname)
                .font(.PretendardLight14)
                .foregroundStyle(.gray)
                .focused($focusField, equals: .nickname)
                .onSubmit {
                    focusField = .email
                }
            
            Divider()
                .background(focusField == .nickname ? Color.primaryGreen : Color.gray)
                .padding(.top, 8)
            
            TextField("이메일", text: $viewModel.email)
                .font(.PretendardLight14)
                .foregroundStyle(.gray)
                .focused($focusField, equals: .email)
                .onSubmit {
                    focusField = .password
                }
                .padding(.top, 32)
            
            Divider()
                .background(focusField == .email ? Color.primaryGreen : Color.gray)
                .padding(.top, 8)
            
            SecureField("비밀번호", text: $viewModel.password)
                .font(.PretendardLight14)
                .foregroundStyle(.gray)
                .focused($focusField, equals: .password)
                .padding(.top, 32)
            
            Divider()
                .background(focusField == .password ? Color.primaryGreen : Color.gray)
                .padding(.top, 8)
        }
    }
    
    private var signupButton: some View {
        Button(action: {
            viewModel.signup()
            dismiss()
        }) {
            Text("생성하기")
                .font(.PretendardMedium16)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(viewModel.isFormValid ? Color.primaryGreen : Color.gray.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .disabled(!viewModel.isFormValid)
    }
}

#Preview {
    SignupView()
}

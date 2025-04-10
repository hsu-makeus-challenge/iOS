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
    @FocusState private var focusField: Field?
    
    private enum Field: Hashable {
        case email
        case password
        case confirmPassword
    }
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 104) {
                signupTitleGroup
                signupForm
                signupButton
            }
            .padding(.horizontal, 20)
        }
        .onChange(of: viewModel.isSignupComplete) { newValue in
            if newValue {
                router.navigate(to: .login)
            }
        }
    }
    
    // MARK: - Components
    private var signupTitleGroup: some View {
        VStack(alignment: .leading) {
            Image(.starbuck)
                .resizable()
                .scaledToFit()
                .frame(width: 97, height: 95)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
            
            Text("회원가입")
                .font(.system(size: 24, weight: .black, design: .default))
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 19)
            
            Text("스타벅스 회원이 되어 다양한 서비스를 이용해보세요")
                .font(.PretendardMedium16)
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity)
    }
    
    private var signupForm: some View {
        VStack(alignment: .leading) {
            TextField("이메일을 입력하세요", text: $viewModel.email)
                .font(.PretendardLight14)
                .foregroundStyle(.gray)
                .focused($focusField, equals: .email)
                .onSubmit {
                    focusField = .password
                }
            
            Divider()
                .background(focusField == .email ? Color.primaryGreen : Color.gray)
            
            if let emailError = viewModel.emailError {
                Text(emailError)
                    .font(.caption)
                    .foregroundColor(.red)
            }
            
            Spacer().frame(height: 49)
            
            SecureField("비밀번호를 입력하세요", text: $viewModel.password)
                .font(.PretendardLight14)
                .foregroundStyle(.gray)
                .focused($focusField, equals: .password)
                .onSubmit {
                    focusField = .confirmPassword
                }
            
            Divider()
                .background(focusField == .password ? Color.primaryGreen : Color.gray)
            
            if let passwordError = viewModel.passwordError {
                Text(passwordError)
                    .font(.caption)
                    .foregroundColor(.red)
            }
            
            Spacer().frame(height: 49)
            
            SecureField("비밀번호를 다시 입력하세요", text: $viewModel.confirmPassword)
                .font(.PretendardLight14)
                .foregroundStyle(.gray)
                .focused($focusField, equals: .confirmPassword)
            
            Divider()
                .background(focusField == .confirmPassword ? Color.primaryGreen : Color.gray)
            
            if let confirmPasswordError = viewModel.confirmPasswordError {
                Text(confirmPasswordError)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
    
    private var signupButton: some View {
        Button(action: {
            viewModel.signup()
        }) {
            Text("회원가입하기")
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

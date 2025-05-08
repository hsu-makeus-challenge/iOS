//
//  OtherView.swift
//  Starbuck
//
//  Created by 송승윤 on 3/27/25.
//

import SwiftUI

struct OtherView: View {
    /// 회원가입시 저장한 닉네임을 표시
    /// 키체인에서 닉네임 불러온 닉네임 상태 변수
    @State private var nickname: String = ""
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var router: NavigationRouter
    
    var body: some View {
        otherHeaderView
        
        Spacer()
        
        ZStack {
            Color.white01
            
            VStack(spacing: 41) {
                // 닉네임 환영 메시지 포함 타이틀 뷰
                otherTitleView
                // 결제 관련 버튼 뷰
                otherPayView
                // 고객지원 관련 버튼 뷰
                otherBottomView
            }//: VStack
        } //: ZStack
        .onAppear {
            // 뷰 등장 시 닉네임 로드
            nickname = KeychainWrapper.load(for: .nickname) ?? ""
        }
    }
    
    // MARK: - Properties
    
    /// OtherView 헤더
    private var otherHeaderView: some View {
        HStack {
            Text("Other")
                .font(.PretendardExtraBold24)
            Spacer()
            
            Button(action: {
                print("로그아웃 클릭")
                dismiss()
            }) {
                Image("logout")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
        }
        .padding(.horizontal, 20)
    }
    
    /// OtherView 타이틀 뷰
    /// - 버튼 컴포넌트화하여 재사용성 높임
    private var otherTitleView: some View {
        VStack (spacing: 24) {
            Group {
                if nickname.isEmpty {
                    Text("작성한 닉네임")
                        .foregroundStyle(Color(.green01)) +
                    Text("님")
                } else {
                    Text(nickname)
                        .foregroundStyle(Color(.green01)) +
                    Text("님")
                }
                Text("환영합니다! 🙌")
            }
            .font(.PretendardSemiBold24)
            HStack (spacing: 10.5) {
                OtherViewButton2(buttonColor: .white, text: "별 히스토리",textColor: .black ,font: .PretendardMedium16, icon: "other1.1", action: {print("별 히스토리 클릭")})
                OtherViewButton2(buttonColor: .white, text: "전자영수증", textColor: .black, font: .PretendardMedium16, icon: "other1.2", action: {
                    router.navigate(to: .reciept)
                })
                OtherViewButton2(buttonColor: .white, text: "나만의 메뉴", textColor: .black, font: .PretendardMedium16, icon: "other1.3", action: {print("나만의 메뉴 클릭")})
            } //: HStack
        } //: VStack
    }
    
    /// 결제 관련 버튼 뷰
    /// - 버튼을 컴포넌트화 하여 재사용성 높임
    private var otherPayView: some View {
        VStack() {
            HStack {
                Text("Pay")
                    .font(.PretendardSemiBold18)
                    .frame(height: 28)
                
                Spacer()
            }
            
            Spacer().frame(height: 8)
            
            HStack {
                OtherViewButton(text: "스타벅스 카드 등록", textColor: .black, font: .PretendardSemiBold16, icon: "other2.1", action: {print("스타벅스 카드 등록 클릭")})
                
                Spacer()
                
                OtherViewButton(text: "카드 교환권 등록", textColor: .black, font: .PretendardSemiBold16, icon: "other2.2", action: {print("카드 교환권 클릭")})
                
                Spacer().frame(width: 10)
            }
            .padding(.vertical, 16)
            
            HStack {
                OtherViewButton(text: "쿠폰 등록", textColor: .black, font: .PretendardSemiBold16, icon: "other2.3", action: {print("쿠폰 등록 클릭")})
                
                Spacer()
                
                OtherViewButton(text: "쿠폰 히스토리", textColor: .black ,font: .PretendardSemiBold16, icon: "other2.4", action: {print("쿠폰 히스토리 클릭")})
                
                Spacer().frame(width: 30)
            }
            .padding(.vertical, 16)
        } //: VStack
        .padding(.horizontal, 10)
    }
    
    /// 고객지원 뷰
    /// - 버튼을 컴포넌트화 하여 재사용성 높임
    private var otherBottomView: some View {
        VStack() {
            HStack {
                Text("고객지원")
                    .font(.PretendardSemiBold18)
                    .frame(height: 28)
                
                Spacer()
            }
            
            Spacer().frame(height: 8)
            
            HStack {
                OtherViewButton(text: "스토어 케어", textColor: .black, font: .PretendardSemiBold16, icon: "other3.1", action: {print("스토어 케어 클릭")})
                
                Spacer()
                
                OtherViewButton(text: "고객의 소리", textColor: .black, font: .PretendardSemiBold16, icon: "other3.2", action: {print("고객의 소리 클릭")})
                
                Spacer().frame(width: 30)
            }
            .padding(.vertical, 16)
            
            HStack {
                OtherViewButton(text: "매장 정보", textColor: .black, font: .PretendardSemiBold16, icon: "other3.3", action: {print("매장 정보 클릭")})
                
                Spacer()
                
                OtherViewButton(text: "반납기 정보", textColor: .black ,font: .PretendardSemiBold16, icon: "other3.4", action: {print("반납기 정보 클릭")})
                
                Spacer().frame(width: 30)
            }
            
            HStack {
                OtherViewButton(text: "마이 스타벅스 리뷰", textColor: .black, font: .PretendardSemiBold16, icon: "other3.5", action: {print("마이 스타벅스 리뷰 클릭")})
                
                Spacer()
            }
            .padding(.vertical, 16)
        } //: VStack
        .padding(.horizontal, 10)
    }
}

#Preview {
    OtherView()
}


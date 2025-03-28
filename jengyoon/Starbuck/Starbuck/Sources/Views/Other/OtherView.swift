//
//  OtherView.swift
//  Starbuck
//
//  Created by 송승윤 on 3/27/25.
//

import SwiftUI

struct OtherView: View {
    @AppStorage("nickname") private var nickname : String = ""
    
    var body: some View {
        otherHeaderView
        
        Spacer()
        
        ZStack {
            Color.gray00
            
            VStack(spacing: 41) {
                otherTitleView
                
                otherPayView
            }//: VStack
        } //: ZStack
        
        
    }
    
    // MARK: - Properties
    
    /// OtherView 헤더
    private var otherHeaderView: some View {
        HStack {
            Text("Other")
                .font(.PretendardExtraBold24)
            Spacer()
            Image("logout")
        }
        .padding(.horizontal, 20)
    }
    
    /// OtherView 타이틀 뷰
    private var otherTitleView: some View {
        VStack (spacing: 24) {
            Text("작성한 닉네임님\n 환영합니다!")
            HStack (spacing: 10.5) {
                OtherViewButton2(buttonColor: .white, text: "별 히스토리", font: .PretendardMedium16, icon: "other1.1", action: {})
                OtherViewButton2(buttonColor: .white, text: "전자영수증", font: .PretendardMedium16, icon: "other1.2", action: {})
                OtherViewButton2(buttonColor: .white, text: "나만의 메뉴", font: .PretendardMedium16, icon: "other1.3", action: {})
            } //: HStack
        } //: VStack
    }
    
    ///OtherView PayView
    private var otherPayView: some View {
        VStack(alignment: .leading) {
            Text("Pay")
                .font(.PretendardSemiBold18)
                .frame(width: 400,height: 28)
            
            Spacer().frame(height: 8)
        
            HStack {
                OtherViewButton(text: "스타벅스 카드 등록", font: .PretendardSemiBold16, icon: "other2.1", action: {})
                
                Spacer()
                
                OtherViewButton(text: "카드 교환권 등록", font: .PretendardSemiBold16, icon: "other2.2", action: {})
            }
            .padding(.vertical, 16)
            
            HStack {
                OtherViewButton(text: "쿠폰 등록", font: .PretendardSemiBold16, icon: "other2.3", action: {})
                
                Spacer()
                
                OtherViewButton(text: "쿠폰 히스토리", font: .PretendardSemiBold16, icon: "other2.4", action: {})
            }
            .padding(.vertical, 16)
        }
    }
}



#Preview {
    OtherView()
}

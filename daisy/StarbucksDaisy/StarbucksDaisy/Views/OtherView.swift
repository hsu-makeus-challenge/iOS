//
//  OtherView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct OtherView: View {
    @AppStorage("nickname") var storedNickname: String = "(작성한 닉네임)"
    
    var body: some View {
        VStack {
            TopContentView
            Spacer()
            PayContentView
            Spacer()
            ServiceContentView
        }
        .background(Color.white01)
        .frame(height: 683)
    }
    
    private var TopContentView: some View {
        VStack(spacing: 24) {
            Text("\(storedNickname) 님\n환영합니다!🙌")
                .font(.mainTextSemiBold24)
            HStack(spacing: 10.5) {
                OtherButtonView(buttonImage: "starHistory", buttonText: "별 히스토리")
                OtherButtonView(buttonImage: "receipt", buttonText: "전자영수증")
                OtherButtonView(buttonImage: "myMenu", buttonText: "나만의 메뉴")
            }
            .frame(width: 375, height: 108)
        }
        .frame(width: 440, height: 209)
    }
    
    private var PayContentView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Pay")
                .font(.mainTextSemiBold18)
                .foregroundStyle(.black)
            
            HStack {
                OtherLabelView(image: "card", text: "스타벅스 카드 등록")
                Spacer()
                OtherLabelView(image: "card_change", text: "카드 교환권 등록")
            }
            .padding(.vertical, 16)
            
            HStack {
                OtherLabelView(image: "coupon", text: "쿠폰 등록")
                Spacer()
                OtherLabelView(image: "coupon_history", text: "쿠폰 히스토리")
            }
            .padding(.vertical, 16)
        }
        .padding(.horizontal, 1)
        .frame(width: 420, height: 164)
    }
    
    private var ServiceContentView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("고객지원")
                .font(.mainTextSemiBold18)
                .foregroundStyle(.black)
            
            HStack {
                OtherLabelView(image: "card", text: "스토어 케어")
                Spacer()
                OtherLabelView(image: "card_change", text: "고객의 소리")
            }
            .padding(.vertical, 16)
            
            HStack {
                OtherLabelView(image: "coupon", text: "매장 정보")
                Spacer()
                OtherLabelView(image: "coupon_history", text: "반납기 정보")
            }
            .padding(.vertical, 16)
            
            HStack {
                OtherLabelView(image: "coupon", text: "마이 스타벅스 리뷰")
                Spacer()
            }
            .padding(.vertical, 16)
        }
        .padding(.horizontal, 1)
        .frame(width: 420, height: 228)
        
    }
    
}

#Preview {
    OtherView()
}

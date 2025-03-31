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
        VStack(spacing: 41) {
            TopBackground
            TopContentView
            PayContentView
            ServiceContentView
            Spacer()
        }
        .background(Color.white01)
        .padding(.horizontal, 10)
//        .background(Color.white01)
    }
    
    private var TopBackground: some View {
        HStack {
            Text("Other")
                .font(.mainTextBold24)
            Spacer()
            Button(action: {
                print("로그아웃")}) {
                    Image("logout")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
        }
        .padding(.horizontal, 23.5)
        .frame(width: 440, height: 80)
        .background(.white)
    }
    
    private var TopContentView: some View {
        VStack() {
            Group {
                Text("\(storedNickname)")
                    .foregroundStyle(.green01)
                + Text("님")
                    .foregroundStyle(.black)
                Text("환영합니다! 🙌")
                    .foregroundStyle(.black)
            }
            .font(.mainTextSemiBold24)
            
            Spacer().frame(height: 24)
            
            HStack(spacing: 10.5) {
                OtherButtonView(buttonImage: "starHistory", buttonText: "별 히스토리")
                OtherButtonView(buttonImage: "receipt", buttonText: "전자영수증")
                OtherButtonView(buttonImage: "myMenu", buttonText: "나만의 메뉴")
            }
        }
    }
    
    /// Pay
    private var PayContentView: some View {
        VStack(alignment: .leading) {
            Text("Pay")
                .font(.mainTextSemiBold18)
                .foregroundStyle(.black)
            
            HStack {
                Button(action: {
                    print("스토어케어")
                }, label:  {
                    OtherLabelView(image: "card", text: "스타벅스 카드 등록")
                })
                
                Spacer()
                Button(action: {
                    print("스토어케어")
                }, label:  {
                    OtherLabelView(image: "card_change", text: "카드 교환권 등록")
                })
                
            }
            .padding(.vertical, 16)
            
            HStack {
                Button(action: {
                    print("스토어케어")
                }, label:  {
                    OtherLabelView(image: "coupon", text: "쿠폰 등록")
                })
                
                Spacer()
                Button(action: {
                    print("스토어케어")
                }, label:  {
                    OtherLabelView(image: "coupon_history", text: "쿠폰 히스토리")
                })
            }
            .padding(.vertical, 16)
            Divider()
                .foregroundStyle(.black.opacity(0.12))
                .padding(.horizontal, 1)
        }
        .padding(.horizontal, 1)
        .frame(height: 164)
    }
    
    /// 고객지원
    private var ServiceContentView: some View {
        VStack(alignment: .leading/*, spacing: 8*/) {
            Text("고객지원")
                .font(.mainTextSemiBold18)
                .foregroundStyle(.black)
            
            HStack {
                Button(action: {
                    print("스토어케어")
                }, label:  {
                    OtherLabelView(image: "store_care", text: "스토어 케어")
                })
                Spacer()
                Button(action: {
                    print("고객의 소리")
                }, label:  {
                    OtherLabelView(image: "customer", text: "고객의 소리")
                })
            }
            .padding(.vertical, 16)
            
            HStack {
                Button(action: {
                    print("매장 정보")
                }, label:  {
                    OtherLabelView(image: "store_info", text: "매장 정보")
                })
                
                Spacer()
                Button(action: {
                    print("반납기 정보")
                }, label:  {
                    OtherLabelView(image: "return_info", text: "반납기 정보")
                })
                
            }
            .padding(.vertical, 16)
            
            HStack {
                Button(action: {
                    print("마이 스타벅스 리뷰")
                }, label:  {
                    OtherLabelView(image: "my_review", text: "마이 스타벅스 리뷰")
                })
                
                Spacer()
            }
            .padding(.vertical, 16)
        }
        .padding(.horizontal, 1)
        .frame(height: 228)
        
    }
    
}

#Preview {
    OtherView()
}

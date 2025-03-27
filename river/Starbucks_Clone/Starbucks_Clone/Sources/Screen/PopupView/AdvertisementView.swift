//
//  AdvertisementView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/27/25.
//

import SwiftUI

struct AdvertisementView: View {
    var body: some View {
        VStack {
            Image(.advertisement)
                .resizable()
                .frame(height: 720)
                .ignoresSafeArea()
            
            Spacer().frame(height: 106)
            
            AdvertisementBtnView()
                .padding(.horizontal, 18)
            
            HStack {
                Spacer()
                
                Button {
                    print("닫기")
                } label: {
                    Text("X 닫기")
                        .font(.mainTextLight14)
                        .foregroundStyle(Color(.gray05))
                }
                
                Spacer().frame(width: 37)
            }
        }
        .frame(height: 920)
        
        Spacer().frame(height: 36)
    }
}

// REFACT: - 로그인 버튼 뷰와 함께 컴토넌트와 필요
struct AdvertisementBtnView: View {
    
    var body: some View {
        Button {
            print("자세히 보기")
        } label: {
            Text("자세히 보기")
                .font(.mainTextMedium16)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 58)
        }
        .background(Color(.green01))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    AdvertisementView()
}

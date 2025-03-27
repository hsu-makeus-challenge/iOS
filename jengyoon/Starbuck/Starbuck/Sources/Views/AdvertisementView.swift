//
//  AdvertisementView.swift
//  Starbuck
//
//  Created by 송승윤 on 3/27/25.
//

import SwiftUI

struct AdvertisementView: View {
    
    // 환경 변수 선언
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Image(.advertisement)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 450, maxHeight: 720)

            Spacer().frame(width: 104)
            
            VStack{
                lookButton
                
                HStack {
                    Spacer()
                    closeButton
                        .padding(.horizontal, 20)
                }
            }
            
            Spacer()
        }
        
    }
    
    // 자세히 보기 버튼
    private var lookButton: some View {
        Button (action: {
            print("자세히 보기")
        }) {
            Text("자세히 보기")
                .font(.PretendardRegular18)
                .foregroundStyle(Color.white)
                .frame(maxWidth: 400, minHeight: 50)
                .background(Color.primaryGreen)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
    
    // 닫기 버튼
    private var closeButton: some View {
        Button(action: {
            dismiss()
        }) {
            HStack(spacing: 4) {
                Image(systemName: "xmark")
                Text("닫기")
            }
            .font(.PretendardLight14)
            .foregroundStyle(Color.gray)
        }
    }
}

#Preview {
    AdvertisementView()
}

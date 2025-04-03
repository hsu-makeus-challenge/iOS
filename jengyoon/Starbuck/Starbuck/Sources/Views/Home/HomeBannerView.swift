//
//  HomeBannerView.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import SwiftUI

struct HomeBannerView: View {
    var body: some View {
        VStack {
            ZStack {
                Image(.homeBanner)
                HStack{
                    Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                        .multilineTextAlignment(.leading)
                        .font(.PretendardBold24)
                    Spacer()
                } //: HStack
                .padding(.leading, 28)
                .padding(.top, 100)
            } //: ZStack
            .frame(maxWidth: .infinity, maxHeight: 226)
            
            HStack{
                
                ProgressView(value: 0.1) {
                    Text("11★ until next Reward")
                        .font(.PretendardSemiBold16)
                        .foregroundStyle(Color("brown02"))
                }
                .tint(Color("brown02"))
                .frame(width: 250, height: 10)
                .padding(.leading, 28)
                
                Spacer()
                
                Text("1")
                    .font(.title)
                Text("/")
                    .font(.title2)
                    .foregroundStyle(Color("gray02"))
                Text("12★")
                    .font(.title2)
                    .foregroundStyle(Color("brown02"))
                
                Spacer()
            }//: HStack
        }//: ZStack
        Image(.homeBanner2)
    }//:VStack
}

#Preview {
    HomeBannerView()
}

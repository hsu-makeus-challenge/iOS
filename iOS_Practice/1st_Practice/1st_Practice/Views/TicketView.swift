//
//  TicketView.swift
//  1st_Practice
//
//  Created by jaewon Lee on 3/18/25.
//

import SwiftUI

struct TicketView: View {
    var body: some View {
//        useZStack()
        noUseZStack()
    }
    
    private var mainTitleGroup: some View {
        VStack {
            Group { // Group이 뭔지 찾아보기
                Text("마이펫의 이중생활2")
                    .font(.PretendardBold30)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                Text("본인 + 동반 1인")
                    .font(.PretendardLight16)
                Text("30,100원")
                    .font(.PretendardBold24)
            }
            .foregroundStyle(Color.white)
        }
        .frame(height: 84)
    }
    
    private var mainBottomGroup: some View {
        Button {
            print("Hello")
        } label: {
            VStack {
                Image(systemName: "chevron.up")
                    .resizable()
                    .frame(width: 18, height: 12)
                Text("예매하기")
                    .font(.PretendardSemiBold18)
                    .foregroundStyle(Color.white)
            }
            .frame(width: 63, height: 40)
        }

    }
    
    private func useZStack() -> some View {
        ZStack {
            Image(.ticketBg)
                .resizable()
                .scaledToFit()
            
            VStack {
                Spacer()
                    .frame(height: 111)
                
                mainTitleGroup
                
                Spacer().frame(height: 134)
                
                mainBottomGroup
            }
        }
        .padding(.horizontal, 28)
    }
    
    private func noUseZStack() -> some View {
        VStack {
            Spacer().frame(height: 111)
            
            mainTitleGroup
            
            Spacer().frame(height: 134)
            
            mainBottomGroup
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(alignment: .center) {
            Image(.ticketBg)
                .resizable()
                .scaledToFit()
                .frame(width: 386, height: 386)
        }
        .padding(.horizontal, 28)
    }
}

#Preview {
    TicketView()
}

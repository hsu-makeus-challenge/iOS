//
//  TicketView.swift
//  1st_Practice
//
//  Created by jaewon Lee on 3/18/25.
//

import SwiftUI

struct TicketView: View {
    var body: some View {
        ZStack {
            Image(.ticketBg)
            mainTitleGroup
        }
        .padding()
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
}

#Preview {
    TicketView()
}

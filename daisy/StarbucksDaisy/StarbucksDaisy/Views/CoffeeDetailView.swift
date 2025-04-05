//
//  CoffeeDetailView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 4/3/25.
//

import SwiftUI

struct CoffeeDetailView: View {
//    let name: String
//    let englishName: String
//    let image: String
//    let content: String
//    let price: Double
//    let isTwoType: Bool
//    let isIce: Bool
//    let isHot: Bool

    var body: some View {
        VStack{
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 440, height: 355)
            VStack(alignment: .leading) {
                /// 상품 이름
                HStack (spacing: 4) {
                    Text("name")
                        .font(.mainTextSemiBold24)
                        .foregroundStyle(.black03)
                    Image("new")
                }
                Spacer().frame(height: 4)
                Text("englishName")
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(.gray01)
                Text("content")
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(.gray06)
                Text("원")
                    .font(.mainTextBold24)
                    .foregroundStyle(.black03)
                
            }
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CoffeeDetailView()
}

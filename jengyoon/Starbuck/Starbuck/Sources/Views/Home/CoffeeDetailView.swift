//
//  CoffeeDetailView.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import SwiftUI

struct CoffeeDetailView: View {
    let coffeeName: String
    @StateObject private var viewModel = CoffeeViewModel()
    
    /// HomeMenuView에서 커피 이름을 받아와 랜더링
    var body: some View {
        if let coffee = viewModel.coffee(for: coffeeName) {
            /// 전체 이미지와 버튼 VStack
            VStack(spacing: 20) {
                Image(coffee.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 440, height: 355)
                
                VStack(alignment: .leading, spacing: 9) {
                    HStack {
                        Text(coffee.title)
                            .font(.PretendardBold24)
                        Image(.new)
                        
                        Spacer()
                    }
                    
                    Text(coffee.englishName)
                        .font(.PretendardLight14)
                        .foregroundStyle(Color.gray)
                }
                
                Text(coffee.discription)
                    .font(.PretendardSemiBold14)
                
                Text("\(coffee.price)원")
                    .font(.PretendardBold24)
                
                Spacer()
                
            }//:VStack
            .ignoresSafeArea()
            
        }
        else {
            Text("해당 커피 정보를 찾을 수 없습니다.")
                .foregroundColor(.red)
        }
    }
}

#Preview {
    CoffeeDetailView(coffeeName: "카페 아메리카노")
}

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
    @State private var selectedOption: CoffeeOption? = nil
    
    
    /// HomeMenuView에서 커피 이름을 받아와 랜더링
    var body: some View {
        if let coffee = viewModel.coffee(for: coffeeName) {
            let temperatureType = coffee.temperatureType
            
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
                
                // 온도 선택 셀렉터 표시 (icedOnly, hotOnly, both인 경우에만)
                if !temperatureType.options.isEmpty {
                    CoffeeTemperatureSelector(type: temperatureType, selectedOption: $selectedOption)
                }
                
                BasicButton(buttonColor: .green00, textColor: .white01, text: "주문하기", font: .PretendardMedium16, action: {
                    print("주문하기 버튼 클릭")
                })
                
                Spacer()
                
            }//:VStack
            .ignoresSafeArea()
            .onAppear {
                // 첫 진입 시 기본 선택값 설정
                selectedOption = temperatureType.defalutOption
            }
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

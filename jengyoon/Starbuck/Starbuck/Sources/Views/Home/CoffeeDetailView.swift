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
    
    // 사용자가 선택한 온도 옵션 (ICED / HOT)
    @State private var selectedOption: CoffeeOption? = nil
    
    var body: some View {
        // 커피 이름으로 모델을 조회하여 정보 렌더링
        if let coffee = viewModel.coffee(for: coffeeName) {
            let temperatureType = coffee.temperatureType
            
            VStack(spacing: 20) {
                
                // 커피 이미지 섹션
                CoffeeImageSection(imageName: coffee.imageName)
                
                // 커피 이름 및 영어 이름 섹션
                CoffeeHeaderSection(
                    title: coffee.title,
                    englishName: coffee.englishName
                )
                
                HStack
                {
                    // 커피 설명 텍스트
                    CoffeeInfoSection(description: coffee.discription)
                    Spacer()
                }
                // 가격 텍스트
                HStack{
                    CoffeePriceSection(price: coffee.price)
                    Spacer()
                }
                // 온도 선택 버튼이 있는 경우에만 렌더링
                if !temperatureType.options.isEmpty {
                    CoffeeTemperatureSelector(
                        type: temperatureType,
                        selectedOption: $selectedOption
                    )
                }
                
                Spacer()
                
                // 하단 주문 버튼 (재사용 가능한 커스텀 컴포넌트)
                BasicButton(
                    buttonColor: .green00,
                    textColor: .white01,
                    text: "주문하기",
                    font: .PretendardMedium16,
                    action: {
                        print("주문하기 버튼 클릭")
                    }
                )
                
                
            }
            .ignoresSafeArea()
            .padding(.bottom, 20)
            .padding(.horizontal, 20)
            .onAppear {
                // 뷰 진입 시 초기 옵션 설정
                selectedOption = temperatureType.defalutOption
            }
        } else {
            // 커피 이름에 해당하는 모델을 찾지 못했을 경우
            Text("해당 커피 정보를 찾을 수 없습니다.")
                .foregroundColor(.red)
        }
    }
}

#Preview {
    CoffeeDetailView(coffeeName: "카페 아메리카노")
}

// MARK: - SubViews

/// 커피 이미지 섹션 뷰
struct CoffeeImageSection: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 440, height: 355)
    }
}

/// 커피 이름과 영어 이름을 보여주는 섹션
struct CoffeeHeaderSection: View {
    let title: String
    let englishName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            HStack {
                Text(title)
                    .font(.PretendardBold24)
                Image(.new) // 새로 나온 커피 표시용 이미지
                Spacer()
            }
            
            Text(englishName)
                .font(.PretendardLight14)
                .foregroundStyle(Color.gray)
        }
    }
}

/// 커피에 대한 설명 텍스트
struct CoffeeInfoSection: View {
    let description: String
    
    var body: some View {
        Text(description)
            .font(.PretendardSemiBold14)
    }
}

/// 커피 가격 텍스트 뷰
struct CoffeePriceSection: View {
    let price: Int
    
    var body: some View {
        Text("\(price)원")
            .font(.PretendardBold24)
    }
}


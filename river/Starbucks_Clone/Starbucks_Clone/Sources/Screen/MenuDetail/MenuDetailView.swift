//
//  MenuDetailView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import SwiftUI

struct MenuDetailView: View {
    @Bindable private var menuDetailViewModel: MenuDetailViewModel

    init(menuDetailViewModel: MenuDetailViewModel) {
        self.menuDetailViewModel = menuDetailViewModel
    }
    
    var body: some View {
        let menu = menuDetailViewModel.menu
        VStack(alignment: .leading) {
            // MARK: - 메뉴 이미지
            Image(menu.menuTemperatureItem[0].imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 440, height: 355)
                .frame(maxWidth: .infinity)

            Spacer().frame(height: 20)

            VStack(alignment: .leading, spacing: 8) {
                // MARK: - 메뉴명
                HStack {
                    Text(menu.menuTemperatureItem[0].imageName)
                        .font(.mainTextSemiBold24)
                        .foregroundStyle(.black)
                    
                    Image(.newIcon)
                        .resizable()
                        .frame(width: 20, height: 10)
                }
                
                Text(menu.menuTemperatureItem[0].menuNameEn)
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(Color(.gray01))
                
                Spacer().frame(height: 32)
                
                Text(menu.menuTemperatureItem[0].description)
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(Color(.gray06))

                Spacer().frame(height: 20)

                // MARK: - 가격
                Text("\(menu.menuTemperatureItem[0].price)원")
                    .font(.mainTextBold24)
                    .foregroundStyle(Color(.black03))
                
                Spacer().frame(height: 32)
                
                Picker(
                    "",
                    selection: $menuDetailViewModel.selectedTemperatureIndex
                ) {
                    ForEach(
                        menu.availableTemperatureTypes.indices,
                        id: \.self
                    ) { index in
                        let temperature = menuDetailViewModel.menu.availableTemperatureTypes[index]
                        Text(temperature.rawValue)
                            .tag(index)
                    }
                }
                .pickerStyle(.segmented)

                Spacer()
                
                OrderButtonView()
            }
            .padding(.horizontal, 16)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - 주문하기 버튼
fileprivate struct OrderButtonView: View {
    fileprivate var body: some View {
        Group {
            Button {
                print("Order")
            } label: {
                Text("주문하기")
                    .font(.mainTextMedium16)
                    .foregroundStyle(.white)
                    .frame(width: 383, height: 43)
            }
            .background(Color(.green01))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .padding(.vertical, 15)
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct MenuDetailView_Preview: PreviewProvider {
    static var previews : some View {
        let previewEnv = AppEnvironment.previewEnv
        ForEach(
            PREVIEW_DEVICE_TYPE.allCases,
            id: \.self
        ) { deviceType in
            MenuDetailView(
                menuDetailViewModel: previewEnv.makeMenuDetailViewModel(
                    menu: MenuDetailModel.mockData[0]
                ))
                .environmentObject(previewEnv)
                .previewDevice(
                    PreviewDevice(rawValue: deviceType.rawValue))
                .previewDisplayName(deviceType.rawValue)
            
        }
    }
}

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
        VStack(alignment: .leading) {
            Image(menuDetailViewModel.menu.variants[0].imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 355)
            
            Spacer().frame(height: 20)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(menuDetailViewModel.menu.variants[0].menuName)
                        .font(.mainTextSemiBold24)
                        .foregroundStyle(.black)
                    
                    Image(.newIcon)
                        .resizable()
                        .frame(width: 20, height: 10)
                }
                
                Text(menuDetailViewModel.menu.variants[0].menuNameEn)
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(Color(.gray01))
                
                Spacer().frame(height: 32)
                
                Text(menuDetailViewModel.menu.variants[0].description)
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(Color(.gray06))
                
                Spacer().frame(height: 20)
                
                Text("9000")
                    .font(.mainTextBold24)
                    .foregroundStyle(Color(.black03))
                
                Spacer().frame(height: 32)
                
                Picker(
                    "",
                    selection: $menuDetailViewModel.selectedType
                ) {
                    ForEach(
                        menuDetailViewModel.availableTypes,
                        id: \.self
                    ) { type in
                        Text(type.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.trailing, 10)
                
                Spacer()
                
                OrderButtonView()
            }
            .padding(.leading, 10)
        }
    }
}

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
        .padding(.horizontal, 28)
        .padding(.vertical, 15)
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
                    menu: MenuDetailModel.mockData[3]
                ))
                .environmentObject(previewEnv)
                .previewDevice(
                    PreviewDevice(rawValue: deviceType.rawValue))
                .previewDisplayName(deviceType.rawValue)
            
        }
    }
}
